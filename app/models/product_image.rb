# ## Description
# The brief description of this model.
#
# ## Fields
  # product [*references*]
  # photo [*attachment*]
  # sort_order [*integer*]
#
class ProductImage < ActiveRecord::Base
  # associations
  belongs_to :product

  # attr accessible
  attr_accessible , :photo, :sort_order

  # validations
  validates :product, :photo, :sort_order, presence: true
  # validates :sort_order, numericality: true, length: TODO

  # default scope
  default_scope :order => 'created_at DESC'

end