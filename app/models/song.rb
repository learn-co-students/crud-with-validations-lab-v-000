class Song < ActiveRecord::Base
  validates :released, inclusion: { in: [ true, false ], message: "%{value} must be true or false"}
  validate :valid_date?
  validate :released?
  validates :artist_name, presence: true
  validates :title, presence: true
  validate :not_repeated?
  validate :present?
  

  def released?
    if released == true
      if release_year == nil 
        errors.add(:release_year, "releases songs must include release years")
      end
    end
  end

  def valid_date?
    if release_year
      release_year.to_i
      if release_year.class != Fixnum
        error.add(:release_year, "release year must be an integer")
      elsif release_year > current_year
        errors.add(:release_year, "release year must less than or equal to current year")
      end
    end
  end


  def not_repeated?
    @title = title 
    @same_title = Song.find_by(title: @title)
    unless @same_title.blank?
      if @same_title.release_year == release_year && @same_title.id != id
        false
        errors.add(:title, "same title cannot be released twice in same year")
      end  
    else
      true
    end
  end

  def current_year
    DateTime.now.year  
  end  


end
