# ## Description
# The brief description of this model.
#
# ## Fields
  # enabled [*boolean*]
  # min_order_value [*decimal*]
  # max_order_value [*decimal*]
  # pincode [*references*]
#
class COD < ActiveRecord::Base
  # associations
  belongs_to :pincode

  # attr accessible
  attr_accessible :enabled, :min_order_value, :max_order_value, 

  # validations
  validates :enabled, :min_order_value, :max_order_value, :pincode, presence: true

  # default scope
  default_scope :order => 'created_at DESC'

end