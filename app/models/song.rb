class Song < ActiveRecord::Base

  # http://guides.rubyonrails.org/active_record_validations.html

  validates :title, presence: true, uniqueness: { scope: :release_year }
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :released_is_true, numericality: { less_than_or_equal_to: 2018 }

  def released_is_true
    self.released == true
  end

end


# rspec spec/models/song_spec.rb
