require 'pry'
class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :release_year, uniqueness: true, inclusion: { in: 0..Date.today.year }



end
