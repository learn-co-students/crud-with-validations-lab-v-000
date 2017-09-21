class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, numericality: { only_integer: true }, if: :released
  validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, if: :released
  validates :artist_name, presence: true

  # validates :unrepeated
  #
  # def unrepeated
  #   return unless title
  #     somthing
  #   unless
  #     self.errors[:title] << 'Cannot repeat song by same artist in same year'
  #   end
  # end

end
