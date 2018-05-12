class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {scope: [:release_year, :artist_name]}

  with_options if: :was_released? do |admin|
    admin.validates :release_year, presence: true
    admin.validates :release_year, numericality: {only_integer: true, less_than_or_equal_to: Time.now.year}
  end

  def was_released?
    !!released
  end
end
