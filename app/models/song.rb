class Song < ApplicationRecord
  validates :title, presence: true
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, presence: true, length: {maximum: 2019}, if: :released?
  validates :artist_name, presence: true

  # Custom Validations

  def repeat?
    
  end


end
