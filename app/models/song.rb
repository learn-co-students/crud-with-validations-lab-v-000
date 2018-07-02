class Song < ActiveRecord::Base

  validate :the_future?
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year }
  validates :release_year, presence: true, if: :released?
  
  private

  def the_future?
    if release_year
      if release_year > DateTime.now.year
        self.title = nil
      end
    else
      true
    end
  end
end
