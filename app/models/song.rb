class Song < ApplicationRecord
    validates :title, presence: true
    validates :released, presence: true


end
