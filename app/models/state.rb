# ## Description
# The brief description of this model.
#
# ## Fields
  # name [*string*]
  # country [*references*]
#
class State < ActiveRecord::Base
  # associations
  belongs_to :country

  # attr accessible
  attr_accessible :name, 

  # validations
  validates :name, :country, presence: true
  # validates :name, length: TODO

  # default scope
  default_scope :order => 'created_at DESC'

end