class MyValidator < ActiveModel::Validator

  # def validate(record)
  #   t = Time.now
  #   if record.release_year > t.year
  #     errors[:release_year] << "The release year cannot be set in the future"
  #   end
  # end
  # => WORKED BUT UNECCESSARY
end
