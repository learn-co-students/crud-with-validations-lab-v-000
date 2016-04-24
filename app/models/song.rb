class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :release_year, presence: true, if: :released? 
  validates :release_year, :inclusion => {:in => 1900..Time.new.year, :message => "can't be greater than current year"}, if: :released?
  validates_uniqueness_of :title, scope: [:release_year]

  def released?
    self.released == true
  end

end
