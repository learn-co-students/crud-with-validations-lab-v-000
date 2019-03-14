class Song < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with MyValidator

  validates :title, presence: true
  validates :title, uniqueness: true if 
  validates :artist_name, presence: true
  validates :released, inclusion: { in: %w(true false)}
  validates :release_year presence: true, if: :released?
end
