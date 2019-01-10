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
    if @song.valid?
      @song.save
      redirect_to @song
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
        @song.save
        redirect_to @song
    else
      render :edit
    end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_url
  end

  end

  private

  def song_params
    params.require(:song).permit( :title, :release_year, :released, :artist_name, :genre)
  end
end
