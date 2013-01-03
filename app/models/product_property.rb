# ## Description
# The brief description of this model.
#
# ## Fields
  # value [*string*]
  # product [*references*]
  # property [*references*]
#
class ProductProperty < ActiveRecord::Base
  # associations
  belongs_to :product
  belongs_to :property

  # attr accessible
  attr_accessible :value, , 

  # validations
  validates :value, :product, :property, presence: true
  # validates :value, length: TODO

  # default scope
  default_scope :order => 'created_at DESC'

end