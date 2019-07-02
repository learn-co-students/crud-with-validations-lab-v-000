class Song < ApplicationRecord
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :title, uniqueness: {
    scope: %i[release_year artist_name],
    message: 'cant be same artist in same year'
  }
  # validates :release_year, presence: true
  
  #  https://apidock.com/rails/Object/with_options
  # validates :content, length: { minimum: 50 }, if: -> { content.present? }
  with_options if: :released? do |song|
   song.validates :release_year, presence: true
   song.validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}
  end

  def released?
   released
  end
  
end