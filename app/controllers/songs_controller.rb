class SongsController < ApplicationController
  before_action :set_song, only: %i[edit update show destroy]
  
  def index
    @songs = Song.all
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
  
  def update
    @song.update(song_params)

    if @song.valid?
     redirect_to song_path(@song)
   else
     render :edit
   end
  end
  
  def show
  end
  
  def new
    @song = Song.new
  end
  
  def destroy
       @song.destroy
    redirect_to songs_path
  end
  
  private
    def set_song
      @song = Song.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end

end
