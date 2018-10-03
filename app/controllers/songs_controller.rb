require 'pry'
class SongsController < ApplicationController
  def new
    @song = Song.new
  end

  def create
    #binding.pry
    @song = Song.new(song_params)
    #binding.pry
    if @song.valid?
      @song.save
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
    @song.update(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_url
  end

  def index
    @songs = Song.all
    #binding.pry
  end

  def show
    @song = Song.find(params[:id])
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name, :release_year, :released, :genre)
  end
end
