class ReleaseYearValidator < ActiveModel::Validator
  def validate(record)
    if record.release_year > Time.current.year
      record.errors[:release_year] << "This is in the future..."
    end
  end
end
