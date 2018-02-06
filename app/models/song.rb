class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :release_year, :numericality => { :less_than_or_equal_to => Time.new.year }, if: :released?
  validates_uniqueness_of :title, :scope => [:release_year, :artist_name]
end
