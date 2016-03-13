
class Songyear < ActiveModel::Validator
	def validate(record)
		if !record.release_year.nil? && record.release_year > 2015
			record.errors[:release_year] << "Release year cannot be in the future"
		end
	end
end