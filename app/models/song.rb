class Song < ActiveRecord::Base
    include ActiveModel::Validations
    validates :title, presence: true
    validates :title, uniqueness: {scope: :release_year, scope: :artist_name}
    validates :released, inclusion: {in: [true, false]}
    validates :release_year, numericality: {only_integer: true, less_than_or_equal_to: ->(_song) { Date.current.year }, if: -> { release_year.present? }}
    validates :artist_name, presence: true
    validates_with MyValidator
end
