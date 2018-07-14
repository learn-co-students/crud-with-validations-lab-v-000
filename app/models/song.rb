class Song < ActiveRecord::Base
  validates :title, presence: true
  # validates
  validates :title, uniqueness: { scope: [:release_year, :artist_name] }
  validates :release_year, presence: true, numericality: { less_than_or_equal_to: Date.today.year }, if: :released?
  validates :artist_name, presence: true

#   def title_check
#     if song.artist
#        song.release_year
#   end
# end
#
#
# def clickbait
#   if !/Won't Believe|Secret|Top \d|Guess/.match(title)
#    errors.add(:title, "is not clickbait-y enough")
#  end
end
