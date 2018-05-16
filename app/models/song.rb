class Song < ActiveRecord::Base
  validates :title, presence: true
  #validates :title, uniqueness: true, if: :same_release_year
  validates :release_year, presence: true, if: :released
  validates :artist_name, presence: true
  validate :release_year_cannot_be_after_current_year
  #  validate :title_not_duplicate_in_same_year

  #def not_duplicate_in_same_year
  #  if title.present?
  #end

  def release_year_cannot_be_after_current_year
    if release_year.present? && release_year > Date.today.year
      errors.add(:release_year, "can't be in the future")
    end
  end
end
