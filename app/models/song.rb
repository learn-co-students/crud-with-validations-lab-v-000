class LetsValidate < ActiveModel::Validator

  def validate(record)
    if record.released == true
      if record.release_year.nil? || record.release_year > Time.now.year
        record.errors[:release_year] << 'We love futuristic music, but the record release date cannot be later than the current date.'
      end
    end
  end
end

class Song < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true, uniqueness: {:scope => [:artist_name, :release_year] }
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true
  validates_with LetsValidate
end
