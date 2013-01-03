# ## Description
# The brief description of this model.
#
# ## Fields
  # itemable [*references*]
  # variant [*references*]
  # quantity [*integer*]
#
class LineItem < ActiveRecord::Base
  # associations
  belongs_to :itemable, polymorphic: true
  belongs_to :variant

  # attr accessible
  attr_accessible , , :quantity

  # validations
  validates :itemable, :variant, :quantity, presence: true
  # validates :quantity, numericality: true, length: TODO

  # default scope
  default_scope :order => 'created_at DESC'

end