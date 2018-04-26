class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: { in: [true, false], allow_blank: true }
  validates :artist_name, presence: true
  validates :release_year, numericality: { :less_than_or_equal_to => 2018, if: :was_released }

  def was_released
    released == true
  end
end
