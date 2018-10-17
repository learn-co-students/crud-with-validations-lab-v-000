class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year }
  validates :artist_name, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: Proc.new { |a| a.released == true }
  validates :release_year, length: { maximum: 2018 }
end
