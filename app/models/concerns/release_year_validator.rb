class ReleaseYearValidator < ActiveModel::Validator
  def validate(record)
    if record[:release_year].to_i > Time.now.year
      record.errors[:release_year] << "This is in the future..."
    elsif record[:released] == true && record[:release_year] == nil
      record.errors[:release_year] << "Release Year required if song has been released."
    end
  end
end
