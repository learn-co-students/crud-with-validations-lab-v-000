class MyValidator < ActiveModel::Validator
    def validate(record)
        if record.released === true && record.release_year.blank?
            record.errors[:release_year] << 'Released songs need a release_date.'
        end
    end
end