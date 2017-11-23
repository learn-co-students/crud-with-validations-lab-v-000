class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    #binding.pry
    if @song.valid?
      #binding.pry
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    @song = set_song!
  end

  def update
    @song = set_song!
    if @song.update(song_params)
      #binding.pry
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    set_song!.destroy
    redirect_to songs_url
  end

  private

  def song_params
    params[:song].permit(:title, :artist_name, :released, :release_year, :genre)
  end

  def set_song!
    @song = Song.find(params[:id])
  end

end
