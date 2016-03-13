class Song < ActiveRecord::Base
	include ActiveModel::Validations
	validates :title, presence: true
	validates :title, uniqueness: {scope: :release_year}
	validates :release_year, presence: true, if: :released

	validates_with Songyear

end
