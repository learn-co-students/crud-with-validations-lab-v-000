class SongsController < ApplicationController

  def index
    @songs = Song.all
  end 

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    #binding.pry

    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end

  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to songs_url
  end
  
  private

  def song_params
    #params.permit(:title, :artist_name, :release_year, :released, :genre)
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end

end
