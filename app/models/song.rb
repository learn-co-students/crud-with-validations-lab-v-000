class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {scope: :release_year}

  validate :release_year

  def release_year
    validates_presence_of :release_year 
  end

end
