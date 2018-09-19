class Song < ActiveRecord::Base
  validates :name, presence: true

end
