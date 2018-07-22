class Song < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true, uniqueness: { scope: :release_year}
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released?, numericality: { less_than_or_equal_to: (DateTime.now.year) }
  validates :artist_name, presence: true
end
