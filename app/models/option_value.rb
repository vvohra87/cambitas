# ## Description
# The brief description of this model.
#
# ## Fields
  # name [*string*]
  # display_name [*string*]
  # option_type [*references*]
#
class OptionValue < ActiveRecord::Base
  # associations
  belongs_to :option_type

  # attr accessible
  attr_accessible :name, :display_name, 

  # validations
  validates :name, :display_name, :option_type, presence: true
  # validates :name, length: TODO
  # validates :display_name, length: TODO

  # default scope
  default_scope :order => 'created_at DESC'

end