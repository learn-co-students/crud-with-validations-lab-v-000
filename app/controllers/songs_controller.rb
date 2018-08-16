require 'pry'
class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    find_me
  end

  def new
    @song = Song.new
  end

  def edit
    find_me
  end

  def update
    find_me
    @song.update(song_params)

    if @song.valid?
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def create
    @song = Song.new(song_params)

    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def destroy
    find_me.destroy
    redirect_to songs_path
  end

  private

  def find_me
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end

end
