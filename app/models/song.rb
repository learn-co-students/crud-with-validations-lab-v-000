class Song < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, uniqueness: {scope: :release_year}
  validates :title, presence: true
  validates :released, inclusion: {in: [true,false], message: "%{value} must be true/false"}
  validates :release_year, presence: true, if: :released
  validates_each :release_year do |record, attr, value|
    if :released && value
      record.errors.add(attr, 'release year invalid') if value > 2018
    end
  end


end
