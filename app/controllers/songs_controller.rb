
class SongsController < ApplicationController
  before_action :find_song, only: [:show, :edit, :update]
  
  def index
    @songs = Song.all 
  end 
  
  def show
  end
  
  def new
    @song = Song.new
  end
  
  def create
    @song = Song.new(song_params(:title, :released, :release_year, :artist_name))
    @song.save
    redirect_to song_path(@song)
  end
  
  def edit 
  end
  
  def update
    @song.update()
  end
  
end
