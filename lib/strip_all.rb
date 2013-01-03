module StripAll
  extend ActiveSupport::Concern

  included do
    before_validation :squish_strings
  end

  def squish_strings
    self.attributes.each { |k,v| self[k] = v.squish if v.respond_to?(:squish) }
  end

end

ActiveRecord::Base.send(:include, StripAll)