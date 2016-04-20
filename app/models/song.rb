class Song < ActiveRecord::Base
  validates :title, presence: true
  #validates :title, uniqueness:   ***TODO: FIGURE THIS OUT ***
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true
  #TODO: figure out how to validate the released year if released

  
end
