class FutureValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    if record[:attribute] > Time.now
      record.errors[:attribute] << (options[:message] || "Can't be a future date")\
    end
  end
  
end
