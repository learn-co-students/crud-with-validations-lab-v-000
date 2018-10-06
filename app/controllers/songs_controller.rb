class SongsController < ApplicationController
  before_action :get_song, only: [:show, :edit, :update]
  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to song_url(@song)
    else
      render "new"
    end
  end

  def update
    if @song.update(song_params)
      redirect_to song_url(@song)
    else
      render "edit"
    end
  end

  def edit
    render "edit"
  end

  def destroy
   @song = Song.find(params[:id])
   @song.destroy
   redirect_to songs_url
 end
  private
  def song_params
    params.require(:song).permit(
      :title,
      :artist_name,
      :release_year,
      :released,
      :genre
    )
  end
  def get_song
    @song = Song.find(params[:id])
  end
end
