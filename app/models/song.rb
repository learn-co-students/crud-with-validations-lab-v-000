class Song < ActiveRecord::Base
  #Must not be blank
  validates :title, presence: true
  #Cannot be repeated by the same artist in the same year
  #validates_uniqueness:true ([:title, :release_year])
  validates_uniqueness_of ([:title, :release_year]),
  message: "cannot be repeated by the same artist in the same year"

  #Must be true or false
  validates :released, inclusion: { in: [true, false] }

  #Optional if released is false
  validates :release_year, presence: false, unless: :released
  #Must not be blank if released is true
  validates :release_year, presence: true, if: :released

  #Must be less than or equal to the current year
  validate :release_year_less_than_or_equal_to_current_year
  #validates :release_year_less_than_or_equal_to_current_year, numericality: true
  #validates :release_year, less_than_or_equal_to: true

  #Must not be blank
  validates :artist_name, presence: true

    def release_year_less_than_or_equal_to_current_year
      if release_year.present?
        if release_year <= Date.today.year
        else errors.add(:release_year, "must be less than or equal to the current year")
        end
      end
    end
  end
