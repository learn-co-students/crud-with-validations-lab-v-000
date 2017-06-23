class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :artist,  message: "should happen once per artist" }
  validates :released, inclusion: { in: [true, false]}, allow_nil: true
  validates :artist_name, presence: true
  validate :needs_release_year

  def needs_release_year
     if released
        release_year <= Time.now.year
     end
  end
end
