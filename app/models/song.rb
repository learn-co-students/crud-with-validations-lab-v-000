class Song < ActiveRecord::Base

  # extend ActiveModel::Naming

  # def initialize
  #   @errors = ActiveModel::Errors.new(self)
  # end

  # attr_accessor :name
  # attr_reader   :errors

  validates :title, presence: true
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :released
  validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, if: :released

  validate :unique_by_artist_in_year?

  def unique_by_artist_in_year?
    songs = Song.all
    songs.each do | s |
      if s.release_year == release_year && s.title == title && s.artist_name == artist_name
        # errors.add(:release_year, ‘cannot put out the same song the same year’)
        errors.add(base: "cannot put out the same song the same year")
      end
    end
  end
end