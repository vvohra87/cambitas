# ## Description
# The brief description of this model.
#
# ## Fields
  # unique_code [*string*]
  # name [*string*]
  # minimum_order_value [*decimal*]
  # flat_discount [*decimal*]
  # percentage_discount [*decimal*]
  # number_of_uses [*integer*]
  # valid_from [*datetime*]
  # valid_till [*datetime*]
  # public [*boolean*]
#
class Coupon < ActiveRecord::Base
  # associations

  # attr accessible
  attr_accessible :unique_code, :name, :minimum_order_value, :flat_discount, :percentage_discount, :number_of_uses, :valid_from, :valid_till, :public

  # validations
  validates :unique_code, :name, :minimum_order_value, :flat_discount, :percentage_discount, :number_of_uses, :valid_from, :valid_till, :public, presence: true
  # validates :unique_code, length: TODO
  # validates :name, length: TODO
  # validates :number_of_uses, numericality: true, length: TODO

  # default scope
  default_scope :order => 'created_at DESC'

end