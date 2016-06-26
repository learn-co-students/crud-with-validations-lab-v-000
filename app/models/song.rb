class Song < ActiveRecord::Base
  # title:string 
  # released:boolean 
  # release_year:integer 
  # artist_name:string

  validates :title, presence: true
  validates :title, uniqueness: {scope: [:release_year, :artist_name], message: "Can only have a title once per year"}
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :has_been_released
  validate :release_must_not_be_future
  validates :artist_name, presence: true


  def has_been_released
    released
  end

  def release_must_not_be_future
    t = Time.now
    release_year <= t.year
  end

end



