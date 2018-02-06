class Song < ActiveRecord::Base
	validates :title, presence: true, uniqueness: { scope: [:artist_name, :release_year] }
	validates :released, inclusion: { in: [true, false] }

	with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end

	# validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }, allow_nil: :false

	# validates :release_year, presence: true, if: :released_is_true?

	validates :artist_name, presence: true
end

def released_is_true?
	self.released == true
end
