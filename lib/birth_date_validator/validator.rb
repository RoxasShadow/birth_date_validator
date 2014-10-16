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
    invalid = if options[:at_least].present?
      value.year > options[:at_least].year
    elsif options[:less_then].present?
      value.year <= options[:less_then].year
    elsif options[:range].present?
      value.year > options[:range].first.year || value.year < options[:range].last.year
    end

    record.errors.add(attribute, options.fetch(:message, :invalid)) if invalid
  end
end
