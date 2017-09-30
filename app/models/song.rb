class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :release_year,
    message: "should happen once per year" }
  #validates_uniqueness_of :title, conditions: -> { where.not(status: 'archived') }
  validates :released, inclusion: { in: [true, false]}

end
