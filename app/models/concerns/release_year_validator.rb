class ReleaseYearValidator < ActiveModel::Validator
  def validate(record)
  	if record.release_year
	    unless record.release_year <= Date.today.year
	      record.errors[:release_year] << 'cannot be in the future'
	    end
    end
  end
end