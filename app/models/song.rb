class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: { in: %w(true false) }
  validate :same_artist_year
  validate :check_release_year

  def same_artist_year
  end

  def check_release_year
    if :released
    end
  end

end
