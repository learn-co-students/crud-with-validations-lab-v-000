class Song < ApplicationRecord
  validates :title,
    presence: true,
    uniqueness: true
  validates :release_year,
    presence: true, if: :released?,
    inclusion: {in: 1900..Date.today.year}

  def released?
    released == true
  end
end
