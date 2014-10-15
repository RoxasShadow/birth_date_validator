require 'rspec'
require 'active_model'
require 'active_support/all'
require 'birth_date_validator'

class TestModel
  include ActiveModel::Validations

  def initialize(attributes = {})
    @attributes = attributes
  end

  def read_attribute_for_validation(key)
    @attributes[key]
  end
end

class TestUserOverAge < TestModel
  validates :birth_date, birth_date: { almost: 18.years.ago, message: 'come back when you will be older' }
end

class TestUserUnderAge < TestModel
  validates :birth_date, birth_date: { less_then: 18.years.ago }
end

class TestUserRange < TestModel
  validates :birth_date, birth_date: { range: 18.years.ago..30.years.ago }
end
