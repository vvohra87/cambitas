# ## Description
# The brief description of this model.
#
# ## Fields
  # title [*string*]
  # slug [*string*]
  # meta_title [*string*]
  # meta_keywords [*string*]
  # meta_description [*text*]
  # description [*text*]
#
class ContentPage < ActiveRecord::Base
  # associations

  # attr accessible
  attr_accessible :title, :slug, :meta_title, :meta_keywords, :meta_description, :description

  # validations
  validates :title, :slug, :meta_title, :meta_keywords, :meta_description, :description, presence: true
  # validates :title, length: TODO
  # validates :slug, length: TODO
  # validates :meta_title, length: TODO
  # validates :meta_keywords, length: TODO

  # default scope
  default_scope :order => 'created_at DESC'

end