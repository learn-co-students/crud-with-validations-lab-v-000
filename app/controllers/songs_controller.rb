class SongsController < ApplicationController
  before_action :find_song, only: [:edit, :update, :show]
  def index
    @songs = Song.all
  end

  def show
    
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else 
      render :new
    end
  end


  def new
    @song = Song.new
  end

  def edit
    
  end

  def update
    
    if @song.update(song_params)
      redirect_to song_path(@song)
    else 
      render :edit
    end
  end

  def destroy 
    Song.find(params[:id]).destroy
    redirect_to songs_path
  end

  private

  def find_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:release_year, :artist_name, :title, :released, :genre)
  end

end
