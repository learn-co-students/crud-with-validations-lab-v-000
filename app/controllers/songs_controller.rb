class SongsController < ApplicationController
  # before_action only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
    # erb :'/index'
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

  def new
    @song = Song.new
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end



    def destroy
      Song.destroy(@song)
      # Song.find(params[:id]).destroy
      # @song = Song.find(params[:id])
      # @song.destroy

      redirect_to songs_path
    end

  end

  private

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end

end
