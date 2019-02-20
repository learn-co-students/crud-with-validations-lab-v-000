require 'pry'

class Song < ActiveRecord::Base
  validates :title, presence: true


  validates :released, inclusion: { in: [true, false] }

  validates :release_year,  numericality: {less_than_or_equal_to: Date.today.year}, presence: true, if: :released

  validates :artist_name, presence: true
  validate :is_not_repeated?


  def is_not_repeated?
    if !self.class.all.empty?
      if self.class.find_by(title: self.title).release_year == self.release_year
        errors.add(:title, "cannot be repeated by the same artist in the same year")
      end
    else
    end
  end
end
