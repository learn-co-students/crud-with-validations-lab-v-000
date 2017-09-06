class Song < ActiveRecord::Base
	include ActiveModel::Validations
	validates :title, presence: true
	validates :artist_name, presence:true
	validates :released, inclusion: { in: [true, false] }
	validates :release_year, presence: true, if: :released
	validates_with ReleaseYearValidator
	validates_with SongAlreadyReleasedValidator
end
