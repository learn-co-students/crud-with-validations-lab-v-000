class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    find_song
  end

  def new
    @song = Song.new
  end

  def edit
    find_song
  end

  def create
    @song = Song.new(post_params)
    @song.save ? redirect_to(song_path(@song)) : render(:new)
  end

  def update
    find_song
    @song.update(post_params)
    @song.valid? ? redirect_to(song_path(@song)) : render(:edit)
  end

  def destroy
    find_song
    @song.delete
    redirect_to(songs_path)
  end

  private
  def find_song
    @song = Song.find_by(id: params[:id])
  end
  def post_params
    params.require(:song).permit(:title, :released, :release_year, :genere, :artist_name)
  end
end
