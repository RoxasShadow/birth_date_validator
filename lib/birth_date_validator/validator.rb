#--
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                    Version 2, December 2004
#
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#  0. You just DO WHAT THE FUCK YOU WANT TO.
#++

class BirthDateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, options.fetch(:message, :invalid)) unless BirthDateValidator.valid?(value, options)
  end

  class << self
    def valid?(birth_date, options)
      age_to_validate = age(birth_date)

      if options[:at_least].present?
        age_to_validate >= age(options[:at_least])
      elsif options[:less_then].present?
        age_to_validate < age(options[:less_then])
      elsif options[:range].present?
        age_to_validate >= age(options[:range].first) && age_to_validate <= age(options[:range].last)
      end
    rescue
      false
    end

  private

    def age(birth_date)
      now = Date.today
      now.year - birth_date.year - ((now.month > birth_date.month || (now.month == birth_date.month && now.day >= birth_date.day)) ? 0 : 1)
    end
  end
end
