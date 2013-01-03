# ## Description
# The brief description of this model.
#
# ## Fields
  # variant [*references*]
  # cost_price [*decimal*]
  # flat_value_markup [*decimal*]
  # percentage_markup [*decimal*]
  # selling_price [*decimal*]
  # tax [*decimal*]
  # valid_from [*datetime*]
#
class PriceList < ActiveRecord::Base
  # associations
  belongs_to :variant

  # attr accessible
  attr_accessible , :cost_price, :flat_value_markup, :percentage_markup, :selling_price, :tax, :valid_from

  # validations
  validates :variant, :cost_price, :flat_value_markup, :percentage_markup, :selling_price, :tax, :valid_from, presence: true

  # default scope
  default_scope :order => 'created_at DESC'

end