class SongsController < ApplicationController
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
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:song).permit(:title)
    end
