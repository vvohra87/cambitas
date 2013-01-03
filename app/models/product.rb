# ## Description
# The brief description of this model.
#
# ## Fields
  # brand [*references*]
  # name [*string*]
  # slug [*string*]
  # meta_title [*string*]
  # meta_keywords [*string*]
  # meta_description [*text*]
  # description [*text*]
  # enabled [*boolean*]
#
class Product < ActiveRecord::Base
  # associations
  belongs_to :brand

  # attr accessible
  attr_accessible , :name, :slug, :meta_title, :meta_keywords, :meta_description, :description, :enabled

  # validations
  validates :brand, :name, :slug, :meta_title, :meta_keywords, :meta_description, :description, :enabled, presence: true
  # validates :name, length: TODO
  # validates :slug, length: TODO
  # validates :meta_title, length: TODO
  # validates :meta_keywords, length: TODO

  # default scope
  default_scope :order => 'created_at DESC'

end