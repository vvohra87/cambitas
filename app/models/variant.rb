# ## Description
# The brief description of this model.
#
# ## Fields
  # sku [*string*]
  # is_master [*boolean*]
  # product [*references*]
  # current_stock [*integer*]
#
class Variant < ActiveRecord::Base
  # associations
  belongs_to :product

  # attr accessible
  attr_accessible :sku, :is_master, , :current_stock

  # validations
  validates :sku, :is_master, :product, :current_stock, presence: true
  # validates :sku, length: TODO
  # validates :current_stock, numericality: true, length: TODO

  # default scope
  default_scope :order => 'created_at DESC'

end