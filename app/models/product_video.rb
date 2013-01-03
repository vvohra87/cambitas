# ## Description
# The brief description of this model.
#
# ## Fields
  # product [*references*]
  # youtube_url [*string*]
  # sort_order [*integer*]
#
class ProductVideo < ActiveRecord::Base
  # associations
  belongs_to :product

  # attr accessible
  attr_accessible , :youtube_url, :sort_order

  # validations
  validates :product, :youtube_url, :sort_order, presence: true
  # validates :youtube_url, length: TODO
  # validates :sort_order, numericality: true, length: TODO

  # default scope
  default_scope :order => 'created_at DESC'

end