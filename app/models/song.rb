require 'pry'
class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year, message: "can release same song only once per year"}
  validate :no_future
  validate :release_year_required

  def no_future
    if release_year.to_i > Time.now.year
      errors.add(:release_year, "release year cannot be in the future")
    end
  end

  def release_year_required
    if released == true
      if release_year == nil
        errors.add(:release_year, "released songs required a released year field")
      end
    end
  end



end
