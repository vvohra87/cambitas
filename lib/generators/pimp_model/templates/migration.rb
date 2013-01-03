class Create<%= class_name.pluralize.delete('::') %> < ActiveRecord::Migration
  def self.up
    create_table :<%= table_name || plural_name.split('/').last %> do |t|
    <%- for attribute in model_attributes -%>
      t.<%= attribute.type %> :<%= attribute.name %> <%= ", polymorphic: true" if attribute.name.ends_with?("able") -%>
    <%- end -%>
      t.timestamps
    end

    <%- for attribute in model_attributes -%>
      <%- if attribute.type == :references -%>
    add_index :<%= table_name || plural_name.split('/').last %>, :<%= attribute.name %>_id
      <%- end -%>
    <%- end -%>
  end

  def self.down
    drop_table :<%= table_name || plural_name.split('/').last %>
  end
end