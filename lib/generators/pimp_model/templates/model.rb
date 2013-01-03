# ## Description
# The brief description of this model.
#
# ## Fields
<%- model_attributes.each_with_index do |attribute, index| -%>
  # <%= attribute.name %> [*<%= attribute.type %>*]
<%- end -%>
#
class <%= class_name %> < ActiveRecord::Base
  # associations
  <%- for attribute in model_attributes -%>
    <%- if attribute.type.to_s == "references" -%>
      <%- if attribute.name.ends_with?("able") -%>
  belongs_to :<%= attribute.name %>, polymorphic: true
      <%- else -%>
  belongs_to :<%= attribute.name %>
      <%- end -%>
    <%- end -%>
  <%- end -%>

  # attr accessible
  attr_accessible <%= model_attributes.map { |a| ":#{a.name}" if a.type.to_s != "references" }.join(", ") %>

  # validations
  validates <%= model_attributes.map { |a| ":#{a.name}" }.join(", ") %>, presence: true
  <%- for attribute in model_attributes -%>
    <%- case attribute.type -%>
      <%- when :integer -%>
  # validates :<%= attribute.name %>, numericality: true, length: TODO
      <%- when :string -%>
  # validates :<%= attribute.name %>, length: TODO
    <%- end -%>
  <%- end -%>

  # default scope
  default_scope :order => 'created_at DESC'

end