class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: { scope: %i[release_year artist_name] }
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, if: [Proc.new { |s| s.released? }]
    validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Date.today.year }, if: [Proc.new { |s| s.released? }]
    validates :artist_name, presence: true
end
