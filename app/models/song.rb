class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year }
  validates :release_year, presence: true, if: :released?
  validate :release_year_in_future?
end

def released?
  released == true
end

def release_year_in_future?
  if !release_year.nil?
    if release_year > Time.current.year
      errors.add(:release_year, "release year cannot be in the future")
    end
  end

end
