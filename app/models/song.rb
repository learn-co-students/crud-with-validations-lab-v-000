class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :title, uniqueness: { scope: :artist_name, :release_year}

  validates :released, inclusion { in: [true, false] }

  validates :release_year, numericality: true, {if: :released, only_integer: true, less_than_or_equal_to: Time.now.year}



end
