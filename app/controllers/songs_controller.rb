class SongsController < ApplicationController
  validates :title, presence: true, uniqueness: {scope: [:release_year, :artist_name]}
  validates :artist_name, presence: :true
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, numerically: {less_than_or_equal_to: Date.today.year}, if :released
end
