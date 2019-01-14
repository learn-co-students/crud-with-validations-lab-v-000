require 'pry'
class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params(:title, :artist_name, :release_year, :released, :genre))
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def show
    @song = Song.find(params[:id])
  end



  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params(:title, :artist_name, :release_year, :released, :genre))
     if @song.save
        redirect_to song_path(@song)
      else
        render :edit
      end
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_url
  end

private

  def song_params(*arg)
    params.require(:song).permit(*arg)
  end


end
