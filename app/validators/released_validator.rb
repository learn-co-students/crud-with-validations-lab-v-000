class ReleasedValidator < ActiveModel::Validator
  def validate(record)
    if record.released == true && record.release_year == nil
      record.errors[:release_year] << "Must include release year."
    elsif record.released == true && record.release_year > Time.now.year
      record.errors[:release_year] << "Release date cannot be in the future."
    end

  end
end
