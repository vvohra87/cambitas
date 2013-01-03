# ## Description
# The brief description of this model.
#
# ## Fields
  # path [*string*]
  # session [*string*]
  # customer [*references*]
  # page_duration [*integer*]
  # db_duration [*integer*]
#
class PageRequest < ActiveRecord::Base
  # associations
  belongs_to :customer

  # attr accessible
  attr_accessible :path, :session, , :page_duration, :db_duration

  # validations
  validates :path, :session, :customer, :page_duration, :db_duration, presence: true
  # validates :path, length: TODO
  # validates :session, length: TODO
  # validates :page_duration, numericality: true, length: TODO
  # validates :db_duration, numericality: true, length: TODO

  # default scope
  default_scope :order => 'created_at DESC'

end