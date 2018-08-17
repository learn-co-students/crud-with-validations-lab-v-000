require 'date'

class Song < ActiveRecord::Base
 include ActiveModel::Validations
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year }
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released?
  validate :in_the_past?

# I do not love this method.
  def in_the_past?
    if release_year
      if release_year > Time.now.year
        errors.add(:release_year, "The future has not happened yet")
      end
    end
  end

  def released?
    self.released == true
  end

end # Song
