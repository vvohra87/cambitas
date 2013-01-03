# ## Description
# The brief description of this model.
#
# ## Fields
  # name [*string*]
  # display_name [*string*]
#
class OptionType < ActiveRecord::Base
  # associations

  # attr accessible
  attr_accessible :name, :display_name

  # validations
  validates :name, :display_name, presence: true
  # validates :name, length: TODO
  # validates :display_name, length: TODO

  # default scope
  default_scope :order => 'created_at DESC'

end