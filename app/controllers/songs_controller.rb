class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    song_params
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(strong_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    song_params
    render :edit
  end

  def update
    song_params
    @song.assign_attributes(strong_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    song_params.destroy
    redirect_to songs_path
  end

  private

  def song_params
    @song = Song.find(params[:id])
  end

  def strong_params
    params.require(:song).permit(:title, :artist_name, :genre, :released, :release_year)
  end

end
