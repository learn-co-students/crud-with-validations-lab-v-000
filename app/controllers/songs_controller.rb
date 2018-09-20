class SongsController < ApplicationController

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
      @song = Song.find(params[:id])
  end

  def index
    @songs = Song.all
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update_attributes(song_params)
        @song.update(song_params)
        redirect_to song_path(@song)
      else
        render :edit
      end
  end

  def delete
    Song.find(params[:id]).destroy
   redirect_to song_url
  end

  private

  def song_params
    params.permit(:title, :released, :release_year, :artist_name, :genre)
  end

end
