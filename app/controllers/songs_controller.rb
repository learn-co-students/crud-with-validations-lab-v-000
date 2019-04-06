class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
  end
  
  def create
  end
  
  def show
    @song = Song.find(params[:id])
  end

  def edit
  end


  private
    def song_params
      params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end

end
