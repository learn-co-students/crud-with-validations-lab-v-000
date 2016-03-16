class Song < ActiveRecord::Base
  validates_presence_of :title, :artist_name
  validates :title, uniqueness: {
    scope: [:release_year, :artist_name]
  }
  validates :released, inclusion: { in: [true, false] }

  with_options if: :released? do |attr|
    attr.validates :release_year, presence: true,
      numericality: {
        less_than_or_equal_to: Time.now.year
      }
  end
end
