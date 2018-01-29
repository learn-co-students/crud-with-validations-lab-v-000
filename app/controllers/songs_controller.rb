class SongsController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all

  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(article_params)

    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end

  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.title = params[:title]
    @song.released = params[:released]
    @song.release_year = params[:release_year]
    @song.artist_name = params[:artist_name]
    @song.genre = params[:genre]

    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def show
    @song = Song.find(params[:id])
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
  def set_article
    @article = Article.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def article_params
    params.require(:title, :released, :release_year).permit(:title, :released, :release_year, :artist_name, :genre)
  end
end
