class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: { in: [ true, false ] }
  validates :release_year, :if => :confirmed_release?, numericality: { :less_than_or_equal_to => Date.today.year }
  # validates_numericality_of :release_year, :only_integer => true, :less_than_or_equal_to => DateTime.now.year  
  validates :artist_name, presence: true
  validates :genre, presence: true


# less_than_or_equal_to: DateTime.now.year 

  def confirmed_release?
    released
  end 

end
