class Song < ActiveRecord::Base
  validates_with MyValidator
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: { in: [true, false] }
end
