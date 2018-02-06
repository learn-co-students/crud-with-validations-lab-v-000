class Song < ActiveRecord::Base
  validates :title, presence: true
  validates_uniqueness_of :title, scope: [:release_year, :artist_name]
  validates :released, inclusion: {in: [true, false]}
  with_options if: :released? do |x|
    x.validates :release_year, presence: true
    x.validates :release_year, inclusion: 0..2016
  end

  def released?
    released
  end
end
