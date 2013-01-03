# ## Description
# The brief description of this model.
#
# ## Fields
  # term [*string*]
  # first_page_products [*string*]
  # number_of_results [*integer*]
#
class SearchRequest < ActiveRecord::Base
  # associations

  # attr accessible
  attr_accessible :term, :first_page_products, :number_of_results

  # validations
  validates :term, :first_page_products, :number_of_results, presence: true
  # validates :term, length: TODO
  # validates :first_page_products, length: TODO
  # validates :number_of_results, numericality: true, length: TODO

  # default scope
  default_scope :order => 'created_at DESC'

end