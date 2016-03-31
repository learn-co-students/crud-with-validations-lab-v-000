class Song < ActiveRecord::Base
  validate :release_year?
  validates :title, presence: true, uniqueness: {scope: :release_year}

  def release_year?
    if released && release_year.nil? || release_year.to_i > Time.new.year
      errors.add(:release_year, "You must include a valid release year")
    end
  end
end
