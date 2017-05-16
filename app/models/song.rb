class Song < ActiveRecord::Base
  validates :artist_name, presence: true
  validates :released, inlusion: {in: [true, false]}

  def not_repeated

  end

  def optional_if_not_released
    if released == true
      
    end
  end
end
