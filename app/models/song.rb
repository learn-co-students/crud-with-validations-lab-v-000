# class TitleValidator < ActiveModel::EachValidator
#   def validate_each(record,attribute,value)
#     record.errors.add(attribute, 'song title already taken for the same release year') if record.class.find_by(artist_name: record.artist_name, title: record.title, release_year: record.release_year)
#   end
# end

# class Song < ActiveRecord::Base
#   validates :title, presence: true, title: true
#   validates :release_year, length: { maximum: 2017 }
#   validates :artist_name, presence: true
#   validates :released, inclusion: {in: [true, false]}
#   validates :release_year, presence: true, if: :released?
# end


class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: [:release_year, :artist_name]}
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, presence: true, numericality: {less_than_or_equal_to: Time.now.year}, if: "released == true"
  validates :artist_name, presence: true
  validates :genre, presence: true
end
