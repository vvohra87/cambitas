# ## Description
# The brief description of this model.
#
# ## Fields
  # name [*string*]
  # city [*references*]
#
class Pincode < ActiveRecord::Base
  # associations
  belongs_to :city

  # attr accessible
  attr_accessible :name, 

  # validations
  validates :name, :city, presence: true
  # validates :name, length: TODO

  # default scope
  default_scope :order => 'created_at DESC'

end