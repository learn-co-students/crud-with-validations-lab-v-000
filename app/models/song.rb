class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {scope {:artist_name, :release_year}} # can't be the same title in the same year for the same artist

  validates :released, inclusion: {in: [true, false]}
  # release_year must be set, if released == true
  validates :release_year, presence: true, if: :released? #EXAMPLE:  validates :card_number, presence: true, if: :paid_with_card?
  validates :release_year, numericality: {less_than_or_equal_to: Date.today.year} #must be this year or before.

  validates :artist_name, presence: true
end
