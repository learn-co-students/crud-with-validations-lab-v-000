class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    song = Song.new(strong_params)
    return render :new unless song.save
    redirect_to song_path(song)
  end

  def update
    return render :edit unless @song.update(strong_params)
    redirect_to song_path(@song)
  end

  private
  def set_song
    @song = Song.find(params[:id])
  end

  def strong_params
    params.require(:song).permit(*%i[title released release_year artist_name genre])
  end
end
