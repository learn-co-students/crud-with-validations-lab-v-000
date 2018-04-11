class Song < ActiveRecord::Base
  validates :title, :artist_name, presence: true
  validates :released, inclusion: {in: %w(true false)}
end
