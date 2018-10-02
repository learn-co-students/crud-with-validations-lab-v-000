class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: { in: [ true, false ] }
  validates :release_year, :numericality => {:less_than_or_equal_to => Time.current.year}, if: :released?
end
