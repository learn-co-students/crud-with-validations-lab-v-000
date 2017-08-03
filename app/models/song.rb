class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: Proc.new { |a| a.released == true }, inclusion: { in: 1500..Date.today.year }
  validates :artist_name, presence: true
end
