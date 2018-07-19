class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: :release_year}
  validates :release_year, presence: true, if: Proc.new{|song| song.released == true}, numericality: {less_than_or_equal_to: Time.now.year}


end
