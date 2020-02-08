class SongsController < ApplicationController
  before_action :find_song, only: [:edit, :show]

  def index
    @songs = Song.all
  end

  def show

  end

  def edit

  end

  def create
    @song = Song.create(post_params)
    redirect_to song_path(@song)
  end


  private

  def find_song
    @song = Song.find(params[:id])
  end

  def post_params
   params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end
end
