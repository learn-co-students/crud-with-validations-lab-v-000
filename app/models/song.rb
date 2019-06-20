class Song < ApplicationRecord
  validates :title, presence: true
  with_options if: :released? do |song|
    song.validates :released, presence: true
    song.validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }
  end
  validates :artist_name, presence: true
  with_options if: :repeated_title? do |song|
    song.validates :release_year, uniqueness: true
  end

  def repeated_title?
    @songs = Song.all
    @songs.any? { |song| song.title == song_params[:title] && song.artist_name == song_params[:artist_name] }
  end
  # def title_repeated_in_same_year
  #   binding.pry
  #   @songs = Song.all
  #   if @songs.any? do |song|
  #     song.artist_name == song_params[:artist_name] && song.release_year == song_params[:release_year] && song.title == song_params[:title]
  #     end
  #     errors.add(:title, "An artist cannot repeat a title in the same year")
  #   end
  # end
end

# class User < ActiveRecord::Base
#   has_many :roles
#
#   # Normal Validations
#   validates_presence_of   :user_name
#   validates_uniqueness_of :user_name
#
#   with_options :if => :driver? do |driver|
#     driver.validates_presence_of :truck_serial
#     driver.validates_length_of :truck_serial, :maximum => 30
#   end
#
#   def driver?
#     roles.any? { |role| role.name == "driver" }
#   end
# end
