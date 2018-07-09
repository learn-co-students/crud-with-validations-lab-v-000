class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :title, uniqueness: { scope: :artist_name }
    validates :released, inclusion: { in: [true, false] }
    with_options if: :released? do |year_rel|
          year_rel.validates :release_year, presence: true
          year_rel.validates :release_year, numericality: { less_than_or_equal_to:  2007 }
    end
    validates :artist_name, presence: true
end
