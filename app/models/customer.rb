# ## Description
# The brief description of this model.
#
# ## Fields
  # name [*string*]
  # gender_cd [*integer*]
  # mobile [*string*]
  # birthday [*date*]
  # is_offline [*boolean*]
  # provider [*string*]
  # uid [*string*]
#
class Customer < ActiveRecord::Base
  # associations

  # attr accessible
  attr_accessible :name, :gender_cd, :mobile, :birthday, :is_offline, :provider, :uid

  # validations
  validates :name, :gender_cd, :mobile, :birthday, :is_offline, :provider, :uid, presence: true
  # validates :name, length: TODO
  # validates :gender_cd, numericality: true, length: TODO
  # validates :mobile, length: TODO
  # validates :provider, length: TODO
  # validates :uid, length: TODO

  # default scope
  default_scope :order => 'created_at DESC'

end