class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def create
    @song = Song.new(post_params(:title, :artist_name, :release_year, :released, :genre))
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def new
    @song = Song.new
  end

  def show
    find_song
  end

  def edit
    find_song
  end

  def update
    find_song
    if @song.update(post_params(:title, :artist_name, :release_year, :released, :genre))
      @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    find_song
    @song.destroy
    redirect_to songs_path
  end


  private

  def post_params(*args)
    params.require(:song).permit(*args)
  end

  def find_song
    @song = Song.find(params[:id])
  end
end



