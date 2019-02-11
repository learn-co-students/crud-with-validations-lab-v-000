class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {scope: [:release_year, :artist_name]}
  validates :released, inclusion: {in: %w(True False)}
  validates :artist_name, presence: true
  validate :optional_release_year

  def optional_release_year
    if self.released == "true"
      validates_presence_of :release_year
    end
  end

end
