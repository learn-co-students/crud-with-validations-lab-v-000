class Song < ApplicationRecord
  include ActiveModel::Validations
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: { in: [ true, false ] }
  validates_with ReleasedValidator

end
