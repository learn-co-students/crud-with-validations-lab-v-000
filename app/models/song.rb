class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: [:artist_name, :release_year] }
  validates :released, inclusion: { in: [ true, false ] }
	validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }, allow_nil: true
	validates_presence_of :release_year, :if => :released?
  validates :artist_name, presence: true

  def is_released_true?
    :released == true && :release_year <= Date.today.year
  end

  # def is_released_year_less_than_or_equal_to_the_current_year?
  #   :release_year <= Date.today
  # end

end
