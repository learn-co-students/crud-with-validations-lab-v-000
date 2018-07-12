class SongsController < ApplicationController
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
    find
  end

  def edit
    find
  end

  def update
    find
    params[:song].each { |k, v| @song.send("#{k}=", v) }
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    find.destroy
    redirect_to songs_path
  end

  private

  def find
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :artist_name, :release_year, :released, :genre)
  end
end
