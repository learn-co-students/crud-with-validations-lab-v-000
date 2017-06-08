class ReleaseYearValidator < ActiveModel::Validator
  def validate(record)
    unless record.release_year.to_i < Time.now.year #Unless the year is valid add the following error
      record.errors[:release_year] << "cannot be greater then current year (#{Time.now.year})"
    end
  end
end

class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: [:release_year, :artist_name], message: "should happen once per artist per year" }
  validates :released, inclusion: { in: [ true, false ] }
  validates :release_year, presence: true, if: Proc.new{|a| a.released}
  validates_with ReleaseYearValidator
  validates :artist_name, presence: true
end
