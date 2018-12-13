class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: { in: [ true, false ] }
  validates :artist_name, presence: true
  # validates :release_year, presence: true, if: :released, :validation_check
  with_options if: :released? do |song|
      song.validates :release_year, presence: true
      song.validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}
      song.validates :title, uniqueness: {scope: :release_year}
    end


end




  # def check_uniq
  #   title.uniq && release_year
  # end
