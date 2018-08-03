class Song < ActiveRecord::Base

#validate :title_unique_by_artist_and_year
#validate :not_optional
#validate :release_year_less_than_current_year

#def release_year_less_than_current_year
#  if release_year > Time.now.year
#end
#end

#def not_optional
#  if released
#    validates :release_year, presence: true
#  end
#end

#def title_unique_by_artist_and_year
#  if title && artist
#    return false
#end
#end

with_options if: :released do |song|
   song.validates :release_year, presence: true
   song.validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}
 end

  validates_uniqueness_of :title, scope: [:release_year, :artist_name]
  validates :title, presence: true
  validates :title, uniqueness: true
#  validates :released, inclusion: { in: %w(true false)}
  validates :artist_name, presence: true
end
