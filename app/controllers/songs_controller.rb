class SongsController < ApplicationController

  def new
    @song = Song.new
  end

  def show
    @song = Song.find(params[:id])
  end


  def create
    @song = Song.new(song_params)
    @song.released = true?(song_params[:released])
    if @song.valid?
      @song.save
      #@songs = Song.all
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def index
    @songs = Song.all
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.assign_attributes(song_params)
    @song.released = true?(song_params[:released])
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
   Song.find(params[:id]).destroy
   redirect_to songs_url
 end

  private

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end

  def true?(obj)
    obj.to_s == "true"
  end

end
