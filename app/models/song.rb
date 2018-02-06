class Song < ActiveRecord::Base
  validates :title, presence: true,
                    uniqueness: { scope: [:release_year]}
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: "released"
  validate :good_year


  def good_year
    unless release_year.to_i < Time.now.year
      self.errors[:release_year] << "That release year is far out man! (it's in the future)"
    end
  end
end
