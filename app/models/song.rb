class Song < ActiveRecord::Base
  validates :title, presence: true 
  validates :title, uniqueness: {
                    scope: :year, 
                    message: "should happen once per year"
                  }
end
