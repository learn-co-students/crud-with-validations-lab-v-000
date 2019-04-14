class Song < ActiveRecord::Base
  validates :title, presence: true
   validates :released, inclusion: [true, false]
   validates :release_year, presence: true, if: :released
   validates :past_year, confirmation: true
   validates :artist_name, presence: true
   validates :unique_title, confirmation: true

   def past_year
     if release_year && release_year != Time.now.year && release_year > Time.now.year
       errors[:release_year] << "Year can't be in the future"
     end
   end

   def unique_title
     song = Song.find_by(title: title)
     if title && song && release_year == song.release_year && artist_name == song.artist_name
         errors[:title] << "That song was released this year"
     end
   end


end
