# ## Description
# The brief description of this model.
#
# ## Fields
  # successful [*boolean*]
  # amount [*decimal*]
  # transaction_id [*string*]
  # bank_transaction_id [*string*]
  # notes [*text*]
#
class OnlinePayment < ActiveRecord::Base
  # associations

  # attr accessible
  attr_accessible :successful, :amount, :transaction_id, :bank_transaction_id, :notes

  # validations
  validates :successful, :amount, :transaction_id, :bank_transaction_id, :notes, presence: true
  # validates :transaction_id, length: TODO
  # validates :bank_transaction_id, length: TODO

  # default scope
  default_scope :order => 'created_at DESC'

end