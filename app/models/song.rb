class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: [:artist_name, :release_year] }
  validates :artist_name, presence: true
  validates :released, inclusion: { in: [true, false] }

  with_options if: :was_released? do |year|
    year.validates :release_year, presence: true
    year.validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Time.new.year }
  end

  def was_released?
    !!released
  end
end
