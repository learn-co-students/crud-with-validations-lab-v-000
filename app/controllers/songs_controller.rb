class SongsController < ApplicationController
  before_action :set_song!, only: [:show, :edit, :update]
  def index
    @songs = Song.all
  end
  def new
    @song = Song.new
  end
  def show
     @song = Song.find_by_id(params[:id])
  end
  def edit
    @song = Song.find(params[:id])
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
  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_path
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song!
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end
