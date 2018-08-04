class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: { in: [ true, false] }
  validates :artist_name, presence: true
  # validate :same_artist_year
  validate :check_release_year

  # def same_artist_year
  #   if :artist
  #     errors.add(:title, "Error message")
  #   end
  # end

  def check_release_year
    if released
      "yes, released"
      # this_year = Date.today.year
      # if release_year > this_year
      #   errors.add(:release_year, "Error message")
      # end
    end
  end

end
