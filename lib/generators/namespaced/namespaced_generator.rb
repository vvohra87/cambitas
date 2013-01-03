require 'rails/generators'
require 'rails/generators/generated_attribute'

class NamespacedGenerator < ::Rails::Generators::Base

  source_root File.expand_path('../templates', __FILE__)

  argument :namespace,          :type => :string
  argument :controller_path,    :type => :string
  argument :model_name,         :type => :string, :required => false

  def initialize(args, *options)
    super(args, *options)
    initialize_template_variables
  end

  def create_controller_files
    template 'controller.rb', File.join('app/controllers', @namespace, "#{@controller_name}_controller.rb")
  end

  def copy_views
    generate_views
  end

  def copy_assets
    # copy_file "bootstrap_datatables.js", "app/assets/javascripts/bootstrap_datatables.js"
    # insert_into_file "app/assets/javascripts/application.js", "//= require bootstrap_datatables\n", :after => "jquery_ujs\n" if File.exist?('app/assets/javascripts/application.js')
    # copy_file "bootstrap_datatables.css", "app/assets/stylesheets/bootstrap_datatables.css"
    # insert_into_file "app/assets/stylesheets/application.css", "*= require bootstrap_datatables\n", :after => "require_self\n" if File.exist?('app/assets/stylesheets/application.css')
  end

  def add_resource_route
    if options[:actions].present?
      actions.reverse.each do |action|
        route %{get "#{@controller_name}/#{action}"}
      end
    else
      namespace_string = "namespace :#{@namespace} do"
      content = File.binread('config/routes.rb')
      if content.include?(namespace_string)
        contents_changed = gsub_file 'config/routes.rb', /#{namespace_string}/m do |match|
          match << "\n    resources :#{@controller_name.pluralize}"
        end
      else
        route_config = namespace_string + "\n"
        route_config << "    resources :#{@controller_name.pluralize} \n"
        route_config << "  end"
        route route_config
      end
    end
  end

  protected

  def initialize_template_variables
    @namespace = namespace.downcase
    @controller_name = controller_path.downcase
    @controller_file_path = [namespace, controller_path.underscore].join('/').downcase
    @controller_routing_path = @controller_file_path.gsub(/\//, '_').downcase
    @model_name = "#{model_name.singularize.camelize}" unless model_name
  end

  def controller_class_name
    @controller_name.camelize
  end

  def controller_routing_path
    @controller_routing_path
  end

  def singular_controller_routing_path
    @controller_routing_path.singularize
  end

  def model_name
    @model_name
  end

  def plural_model_name
    @model_name.pluralize
  end

  def resource_name
    @model_name.demodulize.underscore
  end

  def namespace_name
    @namespace
  end

  def plural_resource_name
    resource_name.pluralize
  end

  def orm_class
    Rails::Generators::ActiveModel
  end

  def orm_instance(name=singular_table_name)
    @orm_instance ||= orm_class.new(name)
  end

  def singular_table_name
    @model_name.underscore.downcase
  end

  def plural_table_name
    @model_name.underscore.pluralize.downcase
  end

  def class_name
    @model_name
  end

  def columns
    begin
      excluded_column_names = %w[id created_at updated_at]
      @model_name.constantize.columns.reject{|c| excluded_column_names.include?(c.name) }.collect{|c| ::Rails::Generators::GeneratedAttribute.new(c.name, c.type)}
    rescue NoMethodError
      @model_name.constantize.fields.collect{|c| c[1]}.reject{|c| excluded_column_names.include?(c.name) }.collect{|c| ::Rails::Generators::GeneratedAttribute.new(c.name, c.type.to_s)}
    end
  end

  def generate_views
    views = {
      "index.html.erb"                 => File.join('app/views', @controller_file_path, "index.html.erb"),
      "new.html.erb"                   => File.join('app/views', @controller_file_path, "new.html.erb"),
      "edit.html.erb"                  => File.join('app/views', @controller_file_path, "edit.html.erb"),
      "_form.html.erb"                 => File.join('app/views', @controller_file_path, "_form.html.erb"),
      "show.html.erb"                  => File.join('app/views', @controller_file_path, "show.html.erb")}
    selected_views = views
    options.engine == generate_erb(selected_views)
  end

  def generate_erb(views)
    views.each do |template_name, output_path|
      template template_name, output_path
    end
  end

end