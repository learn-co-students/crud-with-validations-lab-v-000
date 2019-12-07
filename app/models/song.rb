class Song < ApplicationRecord
    validates :title, presence: true
    validates :release_year, :presence => true, :if => Proc.new { |o| o.released == true }
    validate :past_event, :if => Proc.new { |o| o.release_year != nil }
    validate :different_year

    def past_event
      errors.add(:release_year, "Can't be in the future!") if release_year > Date.today.year
    end 

    def different_year
        if Song.all.find_by(title: self.title) != nil
            same_song = Song.all.find_by(title: self.title)
           errors.add(:release_year, "Can't be in the same year!") if release_year == same_song.release_year
        end
    end
end