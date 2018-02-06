class Song < ActiveRecord::Base
  validates :title, presence: true
  #validates :title, uniqueness: true 
  #validates :released, inclusion: {in: %w(True False) }
  validates_uniqueness_of :title, scope: [:artist_name, :release_year]
  validates :release_year, :numericality => { less_than_or_equal_to: Time.now.year }, :if => :released 
  validates_presence_of :release_year, :if => :released 
=begin
  validate :release_year_validate

  def release_year_validate
    if self.released
      validates :release_year, presence: true
    end
  end
=end
end
