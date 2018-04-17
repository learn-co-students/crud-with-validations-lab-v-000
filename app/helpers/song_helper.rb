module SongHelper
  class ReleaseYearValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      if record.released.present?
        true
      end
    end
  end
end
