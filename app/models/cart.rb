# ## Description
# The brief description of this model.
#
# ## Fields
  # customer [*references*]
#
class Cart < ActiveRecord::Base
  # associations
  belongs_to :customer

  # attr accessible
  attr_accessible 

  # validations
  validates :customer, presence: true

  # default scope
  default_scope :order => 'created_at DESC'

end