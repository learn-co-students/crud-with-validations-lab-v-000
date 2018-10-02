class SongsController < ApplicationController

  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
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

  def show
    set_song
  end

  def edit
    set_song
  end

  def update
    set_song
    @song.update(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    set_song.destroy
    redirect_to songs_url
  end

  private
   # Use callbacks to share common setup or constraints between actions.
   def set_song
     @song = Song.find(params[:id])
   end
    # Never trust parameters from the scary internet, only allow the white list through.
   def song_params
     params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
   end
end
