class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  #validates :release_year, presence: true
  validates :released, presence: true
  validate :release_year_check?

  #song is valid without a release_year when release is false
  def release_year_check? #if this returns true the attribute is validated

    @return_value = true
    if released == false
      @return_value = true
    end

    if released == true
      if !release_year
        @return_value = false
      end
    end
    binding.pry
    @return_value
  end #end release_year_check?

end
