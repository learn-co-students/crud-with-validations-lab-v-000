class Song < ActiveRecord::Base
  validates :title, :artist_name, :genre, presence: true
  validates :title, uniqueness: {scope: [:artist_name, :release_year]}


  with_options if: :released? do |admin|
    admin.validates :release_year, numericality: { less_than_or_equal_to: 2016 }
    admin.validates :release_year, presence: true
  end

  with_options if: !:released? do |admin|
    
    admin.validates :release_year, presence: false
  end
  





  def released?
    released
  end


end
