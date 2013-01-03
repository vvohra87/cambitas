# ## Description
# The brief description of this model.
#
# ## Fields
  # order [*references*]
  # unique_code [*string*]
#
class Shippment < ActiveRecord::Base
  # associations
  belongs_to :order

  # attr accessible
  attr_accessible , :unique_code

  # validations
  validates :order, :unique_code, presence: true
  # validates :unique_code, length: TODO

  # default scope
  default_scope :order => 'created_at DESC'

end