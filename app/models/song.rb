class Song < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with MyValidator

  validates :title, presence: true
  validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}
  validates :artist_name, presence: true
  validates :released, inclusion: { in: %w(true false)}
  validates :release_year, presence: true, if: :released?
end
