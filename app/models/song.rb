class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: {:in => [true, false]}
  validates :release_year, numericality: {only_integer: true}, if: :song_released
  validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}, if: :song_released
  validates :artist_name, presence: true
  validates :title, uniqueness: {
    scope: [:release_year, :artist_name],
    message: "cannot be repeated by the same artist in the same year"
  }

  def song_released
    if released == true
      true
    else
      false
    end
  end
end


