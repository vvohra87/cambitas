def gsub_file(path, regexp, *args, &block)
  content = File.read(path).gsub(regexp, *args, &block)
  File.open(path, 'wb') { |file| file.write(content) }
end

desc "creates all models based on a yaml file"
task :parse_yaml => :environment do
  require 'yaml'
  hash = (YAML.load_file(([Rails.root, '/lib/tasks/setup/db.yaml'].join)))
  has_manys_needed = []
  hash.each do |key1, value1|
    attributes = []
    value1.each do |key, value|
      unless (%w[id updated_at created_at]).include?(key.to_s)
        has_manys_needed << [key, key1.to_s] if value == "references"
        attributes << " #{key}:#{value.gsub(',',':')}"
      end
    end
    p ("rails g pimp_model " + key1.to_s + attributes.join )
    system("rails g pimp_model " + key1.to_s + attributes.join )
  end

  p "Adding Has many relationships to models"

  has_manys_needed.each do |parent, child|
    begin
      search = "# associations"
      content = File.binread("#{Rails.root}/app/models/#{parent}.rb")
      if content.include?(search)
        contents_changed = gsub_file 'config/routes.rb', /#{search}/m do |match|
          match << "\n    has_many: #{child.underscore.pluralize}"
        end
      end
    rescue
      p "Could not add has_many for #{parent} : #{child}"
      next
    end
  end
end