# ## Description
# The brief description of this model.
#
# ## Fields
  # name [*string*]
  # parent_id [*integer*]
  # sort_order [*integer*]
  # enabled [*boolean*]
  # slug [*string*]
  # meta_title [*string*]
  # meta_keywords [*string*]
  # meta_description [*text*]
  # description [*text*]
#
class Category < ActiveRecord::Base
  # associations

  # attr accessible
  attr_accessible :name, :parent_id, :sort_order, :enabled, :slug, :meta_title, :meta_keywords, :meta_description, :description

  # validations
  validates :name, :parent_id, :sort_order, :enabled, :slug, :meta_title, :meta_keywords, :meta_description, :description, presence: true
  # validates :name, length: TODO
  # validates :parent_id, numericality: true, length: TODO
  # validates :sort_order, numericality: true, length: TODO
  # validates :slug, length: TODO
  # validates :meta_title, length: TODO
  # validates :meta_keywords, length: TODO

  # default scope
  default_scope :order => 'created_at DESC'

end