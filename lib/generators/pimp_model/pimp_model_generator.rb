require 'rails/generators/base'
require 'rails/generators/generated_attribute'

# If you use the NamedBase inheritance, a 'name' parameter has to follow the 'rails g pimp_model'.
# Won't work otherwise. If you don't want this, use ::Base
class PimpModelGenerator < Rails::Generators::NamedBase
  include Rails::Generators::Migration

  # Set the path where the code looks for templates within the gem
  source_root File.expand_path('../templates', __FILE__)

  # Method in the 'thor' library which gives you access to the accessor methods
  no_tasks { attr_accessor :model_attributes }

  # This captures the arguments that the generator can take after "rails g pimp_model name"
  argument :attribute_list, :type => :array, :default => [], :banner => "field:type field:type"

  def initialize(args, *options)
    super
    @model_attributes = []
    attribute_list.each do |arg|
      if arg.include?(':')
        @model_attributes << Rails::Generators::GeneratedAttribute.new(*arg.split(':'))
      end
    end
    @model_attributes.uniq!
  end

  def create_model
    template 'model.rb', "app/models/#{model_path}.rb"
  end

  def create_migration
    template 'migration.rb', "db/migrate/#{Time.now.utc.strftime("%Y%m%d%H%M%S")}_create_#{model_path.pluralize.gsub('/', '_')}.rb"
  end

  private

  def plural_name
    name.underscore.pluralize
  end

  def table_name
    if name.include?('::')
      plural_name.gsub('/', '_')
    end
  end

  def class_name
    if name.include?('::')
      name.camelize
    else
      name.camelize
    end
  end

  def model_path
    class_name.underscore
  end

  def model_columns_for_attributes
    class_name.constantize.columns.reject do |column|
      column.name.to_s =~ /^(id|created_at|updated_at)$/
    end
  end

end