# ## Description
# The brief description of this model.
#
# ## Fields
  # loggable [*references*]
  # sign_in_ip [*string*]
#
class AccessLog < ActiveRecord::Base
  # associations
  belongs_to :loggable, polymorphic: true

  # attr accessible
  attr_accessible , :sign_in_ip

  # validations
  validates :loggable, :sign_in_ip, presence: true
  # validates :sign_in_ip, length: TODO

  # default scope
  default_scope :order => 'created_at DESC'

end

"Could not add has_many for loggable : AccessLog"
"Could not add has_many for respondable : SupportTicketResponse"
"Could not add has_many for itemable : LineItem"
"Could not add has_many for shipping_address : Order"
"Could not add has_many for billing_address : Order"
"Could not add has_many for paymentable : Order"