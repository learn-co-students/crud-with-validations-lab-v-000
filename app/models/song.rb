class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: { in: [ true, false ] }
  validates_presence_of :release_year, :if => :confirmed_release?
  validates_numericality_of :release_year, :less_than_or_equal_to => DateTime.now.year  
  validates :artist_name, presence: true
  validates :genre, presence: true


# less_than_or_equal_to: DateTime.now.year 

  def confirmed_release?
    released
  end 

end
