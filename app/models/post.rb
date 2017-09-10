class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :released
  validates :release_year
  validates :artist_name, presence: true

end
