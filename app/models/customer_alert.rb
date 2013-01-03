# ## Description
# The brief description of this model.
#
# ## Fields
  # type_cd [*integer*]
  # customer [*references*]
#
class CustomerAlert < ActiveRecord::Base
  # associations
  belongs_to :customer

  # attr accessible
  attr_accessible :type_cd, 

  # validations
  validates :type_cd, :customer, presence: true
  # validates :type_cd, numericality: true, length: TODO

  # default scope
  default_scope :order => 'created_at DESC'

end