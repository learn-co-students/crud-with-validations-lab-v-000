class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: [:artist_name, :release_year] }

  validates :released, inclusion: {in: [true, false]}

  # validates :release_year, numericality: true, if: :is_released
  with_options if: :is_released do |released|
    released.validates :released, presence: true
    released.validates :release_year, numericality: true
  end
  validate :when_released
  validates :artist_name, presence: true

def is_released
  !!(self.released == true)

end

def when_released
  if release_year && release_year > Time.now.year 
    errors.add(:release_year, "Year does not exist")

end
end
end
