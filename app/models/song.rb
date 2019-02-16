class Song < ActiveRecord::Base
  validates :title, presence: true
  # validates :title, uniqueness: true
  validates :released, inclusion: { in: [true, false]}
  # Optional if released is false

  validate :release_check
  validate :time_check
  validate :same_year


# for release_year
  # Optional if released is false - optoional by default
# if the song hasn't been released yet, then .. what's Optional? validating release_year at all?
    # what does it mean to say that release_year is optional?
  # Must not be blank if released is true
# but if the song has been released, then released_year can't be blank. so I guess it can be blank otherwise
  # Must be less than or equal to the current year

# ban releasing the same song more than once in one year



# it's possible this one will break, because it might still be empty without actually being
# nil. maybe they entered an empty quote string instead of a number. but the test might not see that as
# empty. I can validate for that anyway
  def release_check
    if self.released && !self.release_year
      # binding.pry
      # && !(release_year == "" release_year == " ")
      errors.add(:release_year, "release year must not be blank if 'released' is true")
    end
  end


  def time_check
    # binding.pry
    if self.release_year.to_i > Time.now.year
      # self.release_year.to_i > Time.now.year
      errors.add(:release_year, "release year must not be blank if 'released' is true")
    end
    # if release year is not earlier than this year or in our year, then it's invalid.
    # but for that to make sense, released_year has to exist. and it's optional when the song hasn't been relased uyet.
    # does validations want a true statement in the body of he method or a false one?
    # i can also check or account for the question of whether the song was released yet at all
  end


  def same_year
    # binding.pry
    if Song.where({title: self.title, release_year: self.release_year, artist_name: self.artist_name}) != []
      errors.add(:release_year, "can't have more than one song with the same title made in the same year")
    end
  #   # can check if the song already exists in that year. if so introduce error
  #     # how to check if song was released for that year?
  #       check
  #       song- self
  #       self.released
  #       i'm wondering if i can call Song.all for example and check if any other songs were made that year.
  #       or use like an 'only' method.
  # end
  #
end




end
