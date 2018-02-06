class SongsController < ApplicationController
  before_action :set_song!, only: [:edit, :show, :update]

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)
    @song.valid? ? (redirect_to song_path(@song)) : (render :new)
  end

  def edit
  end

  def update
    @song.update(song_params)
    @song.valid? ? (redirect_to song_path(@song)) : (render :edit)
  end

  def show
  end

  def index
    @songs = Song.all
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_path
  end

  private

  def set_song!
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:artist_name, :released, :title, :release_year, :genre)
  end

end
