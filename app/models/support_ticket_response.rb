# ## Description
# The brief description of this model.
#
# ## Fields
  # support_ticket [*references*]
  # body [*text*]
  # respondable [*references*]
#
class SupportTicketResponse < ActiveRecord::Base
  # associations
  belongs_to :support_ticket
  belongs_to :respondable, polymorphic: true

  # attr accessible
  attr_accessible , :body, 

  # validations
  validates :support_ticket, :body, :respondable, presence: true

  # default scope
  default_scope :order => 'created_at DESC'

end