class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :release_year, presence: true, if: :released
  validate :past_release
  validates :artist_name, uniqueness: { scope: :release_year,
                                        message: 'One song release per year' }

  def past_release
    if release_year && release_year > Date.today.year
      errors.add(:release_year, 'No future releases Doctor Who')
    end
  end
end
