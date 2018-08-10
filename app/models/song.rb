class Song < ActiveRecord::Base
	validates :title, presence: true
    validates :title, uniqueness: true
    validates :released, :inclusion => { :in => [true, false] }
    validates :artist_name, presence: true

    validates :release_year, presence: true
    validates :release_year_valid?, unless: => (x) {x.release_year.blank?}

    def release_year_valid?
    	time = Time.new
    	release_year <= time.year ? true : false
    end
end
