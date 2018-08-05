class SongsController < ApplicationController

  def create
    @song = Song.create(song_params)
    if @song.valid? 
      @song.save
      redirect_to song_path(@song)
    else
      render :new 
    end
  end

  def destroy
    find_song
    @song.destroy
    redirect_to songs_path
  end

  def edit
    find_song
  end

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def show
    find_song
  end

  def update
    find_song
    @song.update(song_params)
    @song.valid? ? (redirect_to song_path(@song)):(render :edit)
  end

  def song_params
    params.require(:song).permit(:title, :artist_name, :release_year, :released, :genre)
  end

end
