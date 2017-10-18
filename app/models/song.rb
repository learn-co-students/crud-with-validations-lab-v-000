class Song < ActiveRecord::Base
  validates :artist_name, presence: true
  validate :release_year_must_exist_if_released, :release_year_must_be_less_than_current_year
  validates :title, presence: true, uniqueness: { scope: [:release_year, :artist_name], message: "should happen once per year per artist" }

end

def release_year_must_exist_if_released
  if released == true && !release_year.present?
    errors.add(:release_year, "must exist if it was released")
  end
end
#
def release_year_must_be_less_than_current_year
  if release_year.present? && released == true && release_year > Time.now.year
    errors.add(:release_year, "can't be released in the future")
  end
end
