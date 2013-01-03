# ## Description
# The brief description of this model.
#
# ## Fields
  # name [*string*]
  # email [*string*]
  # number [*string*]
  # message [*text*]
  # from_page [*string*]
#
class Feedback < ActiveRecord::Base
  # associations

  # attr accessible
  attr_accessible :name, :email, :number, :message, :from_page

  # validations
  validates :name, :email, :number, :message, :from_page, presence: true
  # validates :name, length: TODO
  # validates :email, length: TODO
  # validates :number, length: TODO
  # validates :from_page, length: TODO

  # default scope
  default_scope :order => 'created_at DESC'

end