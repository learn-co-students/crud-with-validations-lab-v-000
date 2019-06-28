class Song < ApplicationRecord
    validates :title, presence: true
    validates :artist_name, presence: true
    validates :released, inclusion: { in: %w(true false) }
end
