# ## Description
# The brief description of this model.
#
# ## Fields
  # unique_code [*string*]
  # name [*string*]
  # customer [*references*]
  # status_cd [*integer*]
#
class SupportTicket < ActiveRecord::Base
  # associations
  belongs_to :customer

  # attr accessible
  attr_accessible :unique_code, :name, , :status_cd

  # validations
  validates :unique_code, :name, :customer, :status_cd, presence: true
  # validates :unique_code, length: TODO
  # validates :name, length: TODO
  # validates :status_cd, numericality: true, length: TODO

  # default scope
  default_scope :order => 'created_at DESC'

end