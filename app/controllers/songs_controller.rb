class SongsController < ApplicationController


  def index
    @songs = Song.all
  end

  def show
    find_song
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    find_song
  end

  def update
    @song = find_song
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    find_song.destroy
    redirect_to songs_path
  end

  private

    def song_params
      params.require(:song).permit(:title, :release_year, :released, :genre, :artist_name)
    end

    def find_song
      @song = Song.find(params[:id])
    end

end
