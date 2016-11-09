class MyValidator < ActiveModel::Validator
    def validate(record)
        if record.released == true
            if record.release_year.present?
                unless (record.release_year <= Time.now.year.to_i)
                    record.errors[:release_year] << "Release year can't be in the future"
                end
                unless Song.all.none? { |s| s.release_year == record.release_year && s.title == record.title  }
                    record.errors[:release_year] << "Can't release two of the same songs in a year"
                end
            else
                record.errors[:release_year] << "Release year can't be empty"
            end
        end
    end
end

class Song < ActiveRecord::Base
    include ActiveModel::Validations
    validates_with MyValidator
    validates :title, presence: true
    validates :released, inclusion: { in: [true,false]}
    validates :artist_name, presence: true

end
