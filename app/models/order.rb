# ## Description
# The brief description of this model.
#
# ## Fields
  # unique_code [*string*]
  # customer [*references*]
  # coupon [*references*]
  # gift_wrap [*boolean*]
  # order_status [*references*]
  # shipping_address [*references*]
  # billing_address [*references*]
  # made_offline [*boolean*]
  # paymentable [*references*]
#
class Order < ActiveRecord::Base
  # associations
  belongs_to :customer
  belongs_to :coupon
  belongs_to :order_status
  belongs_to :shipping_address
  belongs_to :billing_address
  belongs_to :paymentable, polymorphic: true

  # attr accessible
  attr_accessible :unique_code, , , :gift_wrap, , , , :made_offline, 

  # validations
  validates :unique_code, :customer, :coupon, :gift_wrap, :order_status, :shipping_address, :billing_address, :made_offline, :paymentable, presence: true
  # validates :unique_code, length: TODO

  # default scope
  default_scope :order => 'created_at DESC'

end