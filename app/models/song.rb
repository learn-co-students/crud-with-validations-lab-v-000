class Song < ActiveRecord::Base
  validates :title, presence: true
  # validates :title (cannot be repeated by same arist in the same year)

  validates :released, inclusion: [true, false]
  # validates :release_year, (optional if released == false, presence:true if released == true must be <= current year)
  validates :release_year, presence: true, if: :released
    validates :past_year, confirmation: true
  validates :artist_name, presence: true

  def past_year
    if release_year
      if release_year != Time.now.year && release_year > Time.now.year
        errors[:release_year] << "Year can't be in the future"
      end
    end
  end


end
