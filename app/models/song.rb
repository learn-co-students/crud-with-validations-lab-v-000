class Song < ActiveRecord::Base
  validates :title, :artist_name, :genre, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :title, uniqueness: {scope:[:artist_name, :release_year]}
  with_options if: :released do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }

  end

  #---------------------------------------------------------------#
  #  none refractored 
  #---------------------------------------------------------------#
  # validates :title, uniqueness: true
  # validate  :release_validation
  #
  #   def release_validation
  #       if (released && release_year) && (Date.today.year > release_year  unless release_year == nil) || (!released && release_year.nil?)
  #       else
  #             errors[:released] << "errors in release status and year occured"
  #      end
  #   end
  #---------------------------------------------------------------#
end
