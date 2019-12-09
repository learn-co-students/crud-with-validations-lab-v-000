class Song < ApplicationRecord
  validates :released,
    inclusion: {
      in: [true, false], 
      message: "must be 'true' or 'false'"
    }

  validates :release_year, presence: true, unless: -> { !released }
  validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Time.now.year }, allow_blank: true
  # This is ultimately what works best; see notes in my Rails document for the trial and error.

  validates :artist_name, presence: true
  validates :title, presence: true, 
    uniqueness: {
      scope: [:release_year, :artist_name],
      message: "'%{value}' cannot be released by the same artist in the same year"
    }

  def error_messages
    self.errors.full_messages.reverse
  end
end
