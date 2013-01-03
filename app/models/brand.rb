# ## Description
# The brief description of this model.
#
# ## Fields
  # enabled [*boolean*]
  # name [*string*]
  # slug [*string*]
  # meta_title [*string*]
  # meta_keywords [*string*]
  # meta_description [*text*]
  # description [*text*]
#
class Brand < ActiveRecord::Base
  # associations

  # attr accessible
  attr_accessible :enabled, :name, :slug, :meta_title, :meta_keywords, :meta_description, :description

  # validations
  validates :enabled, :name, :slug, :meta_title, :meta_keywords, :meta_description, :description, presence: true
  # validates :name, length: TODO
  # validates :slug, length: TODO
  # validates :meta_title, length: TODO
  # validates :meta_keywords, length: TODO

  # default scope
  default_scope :order => 'created_at DESC'

end