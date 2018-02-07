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

  def edit
    @song = set :song 
  end

  def update
    @song = set :song 
    @song.update(song_params)

    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end

  end

  def show
    @song = set :song
  end

  def destroy
    @song = set :song
    @song.destroy

    redirect_to songs_path
  end

  private

    def song_params
      params.require(:song).permit(:title, :released, :release_year, :artist_name)
    end

    def set(model_name)
      Object.const_get(model_name.capitalize).find(params[:id])
    end

end




