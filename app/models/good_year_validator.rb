class GoodYearValidator < ActiveModel::Validator
  def validate(record)
    if record.release_year && record.released
			if (record.release_year > Date.current.year)
				record.errors[:base] << "The release year must be less than or equal to the current year"
			end
		end
  end
end
