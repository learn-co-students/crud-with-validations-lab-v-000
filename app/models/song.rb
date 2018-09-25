class Song < ActiveRecord::Base
  # validates :title, presence: true
  # validates :released, inclusion: {in: [true, false]}
  # validate :released_before_today?
  # validate :same_song_in_a_year?
  #
  # def released_before_today?
  #   if released == true && release_year == nil
  #     errors.add(:release_year, "must have release_year if released")
  #   elsif released == true && release_year != nil
  #     if release_year > Date.today.year
  #       errors.add(:release_year, "must have been released before today")
  #     end
  #   end
  # end
  #
  # def same_song_in_a_year?
  #   Song.all.each do |song|
  #     if song.title == title && song.release_year == release_year
  #       errors.add(:release_year, "artist already released that song this year")
  #     end
  #   end
  # end

end
