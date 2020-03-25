class SongsController < ApplicationController
  before_action :find_or_create_song, only: [:new, :show, :edit, :update]

  def index
    @songs = Song.all
  end

  def show

  end

  def new

  end

  def create
    binding.pry
    song = Song.new(song_params)
    song.save
    if song.valid?
      redirect_to song_path(song)
    else
      render :new
    end
  end

  def edit

  end

  def update
    song = Song.update(song_params)
    if song
      redirect_to song_path(song)
    else
      render :edit
    end
  end

  private

  def find_or_create_song
    @song = Song.find(params[:id]) || Song.new
  end

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end
end
