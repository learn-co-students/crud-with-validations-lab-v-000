class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new #for form_for in view
  end

  def create
    @song = Song.new(song_params)
    if @song.save #if it passed validations and saved to database
      redirect_to song_path(@song)
    else
      render :new # re-render the songs/new.html.erb template with the current @song instance variable
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
    Song.find(params[:id]).destroy
    redirect_to songs_path #songs index
  end

  private
  def song_params #private method for strong paramaters for song
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end
end