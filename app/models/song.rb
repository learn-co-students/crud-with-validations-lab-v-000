class Song < ApplicationRecord
    validates :title, presence: true
    validates :released, inclusion: { in: ["true", "false"]}
    validates :release_year, presence: true, if: :is_released?
    validates_numericality_of :release_year, :allow_nil => true, less_than_or_equal_to: :Date.today
    validates :artitst_name, presence: true

    def self.year
        Date.today
    end
    def release_year_is_before_or_equal_to_today
        if release_year > Date.today
            errors.add(:release_year, "can't be in the future")
        end
    end
    def self.is_released?
        validates :released, inclusion: { in: ["true", "false"]}
    end
end
