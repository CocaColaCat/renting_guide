class Renter < ActiveRecord::Base
  include ActiveModel::Validations
  include GoingPostal
 
  attr_accessible :email, :postcode
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => 'Please provide a valid email address.'

  class PostcodeValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      record.errors.add attribute, (options[:message] || "Please provide a valid UK postcode.") unless
      GoingPostal.postcode?(value, "GB")
    end
  end

  validates :postcode, :postcode => true
end

