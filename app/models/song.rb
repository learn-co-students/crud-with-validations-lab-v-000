class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :title, uniqueness: true
    validates :artist_name, presence: true
    validates :artist_name, uniqueness: true
    validates :released, inclusion: { in: [ true, false ] }

    validates :release_year, inclusion: {in: [ true, false]}

#   costume validator

    def release_year_is_integer
            # release_year, an integer
            release_year.integer?

    end

    def Optional_if_released_is_false
        Optional if released is false
    end


    def  must_not_be_blank_if_released_is_true
        # Must not be blank if released is true
        #must be blank if released is false
        if released = true
          !release_year.blank?  # release_year cant be blank
        end
    end
        
    def  must_be_less_than_or_equal_to_the_current_year
        if release_year.present? && release_year < Date.current.year
            errors.add(:release_year, "can't be in the past")
        end
    end

end



