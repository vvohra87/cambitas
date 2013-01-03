# ## Description
# The brief description of this model.
#
# ## Fields
  # variant [*references*]
  # change [*integer*]
  # reason [*string*]
#
class StockUpdate < ActiveRecord::Base
  # associations
  belongs_to :variant

  # attr accessible
  attr_accessible , :change, :reason

  # validations
  validates :variant, :change, :reason, presence: true
  # validates :change, numericality: true, length: TODO
  # validates :reason, length: TODO

  # default scope
  default_scope :order => 'created_at DESC'

end