class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all

  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(title: params[:song][:title], release_year: params[:song][:release_year], released: params[:song][:released], genre: params[:song][:genre], artist_name: params[:song][:artist_name])

    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end

  end

  def edit
  end

  def update
    @song.title = params[:song][:title]
    @song.released = params[:song][:released]
    @song.release_year = params[:song][:release_year]
    @song.artist_name = params[:song][:artist_name]
    @song.genre = params[:song][:genre]

    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_song
    @song = Song.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  # def song_params
  #   params.require(:title, :released, :release_year).permit(:title, :released, :release_year, :artist_name, :genre)
  # end
end
