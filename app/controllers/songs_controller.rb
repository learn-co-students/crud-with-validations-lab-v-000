class SongsController < ApplicationController
  before_action :find_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def show

  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)
    render_or_redirect(:new)
  end

  def edit

  end

  def update
    @song.update(song_params)
    render_or_redirect(:edit)
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private

  def find_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end

  def render_or_redirect(action)
    if @song.valid?
      redirect_to song_path(@song)
    else
      render action
    end
  end

end
