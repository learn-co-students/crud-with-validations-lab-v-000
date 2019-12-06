class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find_by_id(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
  
    if @song.save
      redirect_to song_path(@song)
    else
      #raise @song.errors.full_messages.inspect
      render :new
    end
  end

  def song_params
    params.require(:song).permit(:title, :artist_name, :genre, :released, :release_year)
  end
end
