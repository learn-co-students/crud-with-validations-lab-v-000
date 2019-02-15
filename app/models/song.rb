class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :released, inclusion: { in: [ true, false ] }
  validates :release_year, presence: true, numericality: { less_than_or_equal_to: Time.current.year}, if: :released
  validates :artist_name, presence: true
  # validate :same_year?

  # def same_year?
  #   # binding.p


  #   if Song.all.any? {|song| self.title.include?(song)}
  #     release_year.uniq
  #   else
  #     errormessage
  #   end
  # end

end


# if self.title
#       unless clickbaity_words.any? {|word| self.title.include?(word)}
#         errors.add(:title, "must be clickbaity")
#       end
#     end