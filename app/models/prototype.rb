# ## Description
# The brief description of this model.
#
# ## Fields
  # name [*string*]
#
class Prototype < ActiveRecord::Base
  # associations

  # attr accessible
  attr_accessible :name

  # validations
  validates :name, presence: true
  # validates :name, length: TODO

  # default scope
  default_scope :order => 'created_at DESC'

end