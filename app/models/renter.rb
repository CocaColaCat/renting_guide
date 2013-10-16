class Renter < ActiveRecord::Base
  include ActiveModel::Validations
  include GoingPostal
 
  attr_accessible :email, :postcode
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => 'seems not right.'

  class PostcodeValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      record.errors.add attribute, (options[:message] || "is not an postcode") unless
      GoingPostal.postcode?(value, "GB")
    end
  end

  validates :postcode,  :presence => true, :postcode => true
end

