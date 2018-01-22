class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: :release_year}
  #validates :released, inclusion: { in: %w(true false)}
  #validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}, presence: { released: true}, unless: Proc.new {|s| s.released == false}
  #validates :artist_name, presence: true
end
