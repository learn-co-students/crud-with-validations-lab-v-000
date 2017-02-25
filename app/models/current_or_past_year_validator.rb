class CurrentOrPastYearValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value && value <= Time.now.year
      record.errors[attribute] << (options[:message] || "must not be in the future")
    end
  end
end
