class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find_by_id(params[:id])
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

  def update
    @song = Song.find_by_id(params[:id])
    @song.update(song_params)
    if @song.valid?
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find_by_id(params[:id])
    @song.destroy
    redirect_to songs_path
  end

  def edit
    @song = Song.find_by_id(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :released, :release_year_validity, :artist_name, :genre)
  end

end
