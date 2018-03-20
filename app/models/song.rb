class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :release_year, numericality: {less_than_or_equal_to: :current_year}, presence: true, if: :released
  #validates :release_year, 
  def current_year
    Time.new.year
  end
end
