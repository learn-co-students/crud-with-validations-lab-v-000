class Song < ActiveRecord::Base

  validates_uniqueness_of :title, scope: [:artist_name, :release_year]
  #artist name appears only once for a single title for a particular release year
  #validates_inclusion_of :released, in: [true, false]
  validates :released, inclusion: { in: [ true, false ] }
  validates :release_year, numericality: { less_than_or_equal_to: Time.now.year}, allow_nil: true
  validates_presence_of :release_year, if: :released?
  validates :title, presence: true
end


#when released = true, run validations on release_year, release_year should = invalid if not present or after present time
#when released = false, run validations on release_year but not for presence, release_year should = valid if nil
