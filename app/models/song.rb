class Song < ActiveRecord::Base
  validates :title, :artist_name, presence: true
  validates :title, uniqueness: { scope: [:release_year, :artist_name]}
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :release_is_true?

  def release_is_true?
    :released == true
  end

end
