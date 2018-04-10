class Song < ActiveRecord::Base
  validates :title , uniqueness: true
  validates :title , presence: true
  validates :release_year , presence: true, if: :released?
   validates :released, inclusion: { in: [ true, false ] }
  validates :release_year , numericality: {less_than_or_equal_to: (Time.now.year)}, if: :released?
end
