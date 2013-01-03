# ## Description
# The brief description of this model.
#
# ## Fields
  # short_name [*string*]
  # first_name [*string*]
  # last_name [*string*]
  # contact_number [*string*]
  # line_one [*string*]
  # line_two [*string*]
  # pincode [*references*]
  # city [*references*]
  # state [*references*]
  # country [*references*]
#
class CustomerAddress < ActiveRecord::Base
  # associations
  belongs_to :pincode
  belongs_to :city
  belongs_to :state
  belongs_to :country

  # attr accessible
  attr_accessible :short_name, :first_name, :last_name, :contact_number, :line_one, :line_two, , , , 

  # validations
  validates :short_name, :first_name, :last_name, :contact_number, :line_one, :line_two, :pincode, :city, :state, :country, presence: true
  # validates :short_name, length: TODO
  # validates :first_name, length: TODO
  # validates :last_name, length: TODO
  # validates :contact_number, length: TODO
  # validates :line_one, length: TODO
  # validates :line_two, length: TODO

  # default scope
  default_scope :order => 'created_at DESC'

end