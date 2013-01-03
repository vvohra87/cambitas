# ## Description
# The brief description of this model.
#
# ## Fields
  # method_cd [*integer*]
  # cheque_number [*string*]
  # amount [*decimal*]
  # notes [*text*]
#
class OfflinePayment < ActiveRecord::Base
  # associations

  # attr accessible
  attr_accessible :method_cd, :cheque_number, :amount, :notes

  # validations
  validates :method_cd, :cheque_number, :amount, :notes, presence: true
  # validates :method_cd, numericality: true, length: TODO
  # validates :cheque_number, length: TODO

  # default scope
  default_scope :order => 'created_at DESC'

end