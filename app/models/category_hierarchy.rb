# ## Description
# The brief description of this model.
#
# ## Fields
  # ancestor [*references*]
  # descendant [*references*]
  # generations [*integer*]
#
class CategoryHierarchy < ActiveRecord::Base
  # associations
  belongs_to :ancestor
  belongs_to :descendant

  # attr accessible
  attr_accessible , , :generations

  # validations
  validates :ancestor, :descendant, :generations, presence: true
  # validates :generations, numericality: true, length: TODO

  # default scope
  default_scope :order => 'created_at DESC'

end