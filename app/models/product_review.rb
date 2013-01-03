# ## Description
# The brief description of this model.
#
# ## Fields
  # customer [*references*]
  # product [*references*]
  # rating [*integer*]
  # body [*text*]
#
class ProductReview < ActiveRecord::Base
  # associations
  belongs_to :customer
  belongs_to :product

  # attr accessible
  attr_accessible , , :rating, :body

  # validations
  validates :customer, :product, :rating, :body, presence: true
  # validates :rating, numericality: true, length: TODO

  # default scope
  default_scope :order => 'created_at DESC'

end