class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(get_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def show
    get_song
  end

  def edit
    get_song
  end

  def update
    get_song
    if @song.update(get_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  private

    def get_song
      @song = Song.find(params[:id])
    end

    def get_params
      params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end

end
