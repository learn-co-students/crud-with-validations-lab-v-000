class Song < ActiveRecord::Base
  # validates :title, presence: true
  # validates :title, uniqueness: {
  #   scope: [:release_year, :artist_name],
  #   message: "cannot be repeated by the same artist in the same year"
  # }
  # validates :released, inclusion: { in: [true, false]}
  # validates :artist_name, presence: true

  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, presence: true, if: :released?
  validates :artist_name, presence: true

  def released?
    released == true
  end
end
