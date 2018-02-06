class SongsController < ApplicationController

  def index
    @songs = Song.all
    #binding.pry
  end

  def new
    @song = Song.new
  end

  def show
    binding.pry
    @song = Song.find_by(params[:id])
  end

  def edit
    #binding.pry
    @song = Song.find_by(params[:id])
  end

  def create
    @song = Song.new(params.require(:song).permit(:title, :artist_name, :release_year, :released, :genre))
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
#    binding.pry
  end

  def show
    @song = Song.find_by(params[:id])
    #binding.pry
  end

  def update
    @song = Song.find_by(params[:id])
    @song.assign_attributes(params.require(:song).permit(:title, :artist_name, :release_year, :released, :genre))
    if @song.valid?
      @song.update(params.require(:song).permit(:title, :artist_name, :release_year, :released, :genre))
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find_by(params[:id])
    if !@song.nil?
      @song.destroy
    end
    redirect_to songs_path
    #binding.pry
  end

end
