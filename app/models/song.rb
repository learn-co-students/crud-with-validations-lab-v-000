class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates(:release_year, { :numericality => { :less_than_or_equal_to => Date.today.year}})
  validate :release_year_no_release

  def release_year_no_release
    if self.released == true
      unless self.release_year != nil
        self.errors[:release_year] << "When was it Released?"
      end
    end
  end

end
