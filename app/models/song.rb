class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :release_year, numericality: {only_integer: true }, if: :released?
  validates :artist_name, presence: true
  validate :not_in_the_future
  validate :same_artist_same_year

 def released?
   self.released == true
 end

  def not_in_the_future
    if !!self.release_year
      if self.release_year > Time.new.year
        errors.add(:release_year, "can't be in the future")
      end
    end
  end

    def same_artist_same_year
      if !!self.title
        self.class.all.each do |song|
          if song.title == self.title
            if song.release_year == self.release_year
              if song.id != self.id
              errors.add(:title, "was already released by this artist this year")
            end
          end
        end
      end
    end
  end

end
