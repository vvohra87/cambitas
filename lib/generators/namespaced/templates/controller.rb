class <%= namespace_name.camelize + "::" + controller_class_name %>Controller < ApplicationController
  # GET <%= controller_routing_path %>
  # GET <%= controller_routing_path %>.json
  def index
    @<%= plural_table_name %> = <%= orm_class.all(class_name) %>

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: <%= "@#{plural_table_name}" %> }
    end
  end

  # GET <%= controller_routing_path %>/1
  # GET <%= controller_routing_path %>/1.json
  def show
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: <%= "@#{singular_table_name}" %> }
    end
  end

  # GET <%= controller_routing_path %>/new
  # GET <%= controller_routing_path %>/new.json
  def new
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: <%= "@#{singular_table_name}" %> }
    end
  end

  # GET <%= controller_routing_path %>/1/edit
  def edit
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
  end

  # POST <%= controller_routing_path %>
  # POST <%= controller_routing_path %>.json
  def create
    @<%= singular_table_name %> = <%= orm_class.build(class_name, "params[:#{singular_table_name}]") %>

    respond_to do |format|
      if @<%= orm_instance.save %>
        format.html { redirect_to [:<%= namespace_name %>, @<%= singular_table_name %>], notice: <%= "'#{class_name} was successfully created.'" %> }
        format.json { render json: <%= "@#{singular_table_name}" %>, status: :created, location: <%= "@#{singular_table_name}" %> }
      else
        format.html { render :new }
        format.json { render json: <%= "@#{orm_instance.errors}" %>, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT <%= controller_routing_path %>/1
  # PATCH/PUT <%= controller_routing_path %>/1.json
  def update
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>

    respond_to do |format|
      if @<%= orm_instance.update_attributes("params[:#{singular_table_name}]") %>
        format.html { redirect_to [:<%= namespace_name %>, @<%= singular_table_name %>], notice: <%= "'#{class_name} was successfully updated.'" %> }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: <%= "@#{orm_instance.errors}" %>, status: :unprocessable_entity }
      end
    end
  end

  # DELETE <%= controller_routing_path %>/1
  # DELETE <%= controller_routing_path %>/1.json
  def destroy
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
    @<%= orm_instance.destroy %>

    respond_to do |format|
      format.html { redirect_to <%= controller_routing_path %>_path }
      format.json { head :no_content }
    end
  end

end