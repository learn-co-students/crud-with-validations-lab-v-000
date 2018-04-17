class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :artist_name, presence: true
  validates :genre, presence: true
  validates :released, inclusion: {in: [true, false] }
  validates_presence_of :release_year, if: Proc.new{|obj| obj[:released] == true}, message: " cannot be set if the song is not released yet!"
  validates_inclusion_of :release_year, :in => 0..2018, if: Proc.new{|obj| obj[:release_year].present?}, message: " cannot be released in the future!"
end
