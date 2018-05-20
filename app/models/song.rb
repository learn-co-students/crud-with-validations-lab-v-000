class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: [:artist_name, :release_year]}
  validates :release_year,presence: true, if: :released?, numericality: { only_integer: true, allow_nil: true, less_than_or_equal_to: Time.now.year }

  def released?
    released
  end
end


#rspec ./spec/models/song_spec.rb --fail-fast
