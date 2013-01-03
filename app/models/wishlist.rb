# ## Description
# The brief description of this model.
#
# ## Fields
  # customer [*references*]
  # is_public [*boolean*]
  # slug [*string*]
#
class Wishlist < ActiveRecord::Base
  # associations
  belongs_to :customer

  # attr accessible
  attr_accessible , :is_public, :slug

  # validations
  validates :customer, :is_public, :slug, presence: true
  # validates :slug, length: TODO

  # default scope
  default_scope :order => 'created_at DESC'

end