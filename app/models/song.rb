class Song < ActiveRecord::Base
  validates :title, presence: true 
  validates :title, uniqueness: {scope: [:release_year, :artist_name], message: "Just one song per year"}
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, :presence => true, :if => :released?
  validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}, 
  :allow_nil => true 
  # optional if :released is false - The :allow_nil option skips the validation when the value being
  # validated is nil.
  validates :artist_name, presence: true
end
