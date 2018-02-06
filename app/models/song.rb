require 'date'

class Song < ActiveRecord::Base
  validates :title, presence: true

  validates :title, uniqueness: { scope: [:release_year,:artist_name], message: "cannot be repeated by the same artist in the same year" }

  validates :released, inclusion: { in: [true, false], message: "%{value} is not a valid category" }
  validates :release_year, presence: true, :if => :released


  validates_numericality_of :release_year, :allow_blank => true, :less_than_or_equal_to => Time.current.year
  validates :artist_name, presence: true




end
