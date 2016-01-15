module SongsHelper

  class ReleaseYearValidator < ActiveModel::Validator
    def validate(record)
      if record.released == true && record.release_year == nil
        record.errors[:base] << "Release Year cannot be blank if Song was released."
      end
      if record.release_year != nil && record.release_year > Time.new.year
        record.errors[:base] << "Release Year cannot be in the future."
      end
    end
  end

  class TitleDupeValidator < ActiveModel::Validator
    def validate(record)
      second = Song.find_by_title(record.title)
      if second != nil && second.artist_name == record.artist_name && second.release_year == record.release_year
        record.errors[:base] << "An artist may not release the same song title twice in one year."
      end
    end
  end

end
