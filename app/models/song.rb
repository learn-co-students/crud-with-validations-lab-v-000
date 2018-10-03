class Song < ActiveRecord::Base
  validates :title, :artist_name, presence: true
  validates :title, uniqueness: {scope: :release_year}
  validates :released, inclusion: {in: [true, false]}
  with_options if: :released do
    validates :release_year, presence: true, inclusion: { in: 1900..Date.today.year }
  end
end
