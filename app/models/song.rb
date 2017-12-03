class Song < ActiveRecord::Base
  validates :title, presence:true, uniqueness: { scope: :release_year }
  validates :artist_name, presence: true
  validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}, if: Proc.new { |r| r.released == true }
  validates :release_year, presence:true, if: Proc.new { |r| r.released == true }
end
