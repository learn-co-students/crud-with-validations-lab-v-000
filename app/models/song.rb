class Song < ActiveRecord::Base
  validates :title, presence: true
  with_options if: :released do
    validates :release_year, presence: true
    validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Date.current.year }
  end
  validates :title, uniqueness: true

end
