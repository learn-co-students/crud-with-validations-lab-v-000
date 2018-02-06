# 888   |      e      Y88b      / 888  e88~-_  888  /
# 888___|     d8b      Y88b    /  888 d888   \ 888 /
# 888   |    /Y88b      Y88b  /   888 8888     888/\
# 888   |   /  Y88b      Y888/    888 8888     888  \
# 888   |  /____Y88b      Y8/     888 Y888   / 888   \
# 888   | /      Y88b      Y      888  "88_-~  888    \


class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {
    scope: [:release_year, :artist_name],
    message: "cannot be repeated by the same artist in the same year"
  }
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true

  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }

  def released?
    released
  end
end
end
