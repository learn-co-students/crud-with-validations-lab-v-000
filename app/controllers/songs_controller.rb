class SongsController < ApplicationController
  def index
    @songs=Song.all
  end

  def new
    @song=Song.new  #best practice to make this here?
  end

  def create
    @song=Song.new(strong_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def show
    @song=Song.find(params[:id])
  end

  def edit
    @song=Song.find(params[:id])
  end

  def update
    @song=Song.find(params[:id])
    @song.assign_attributes(strong_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end

  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_path
  end


  private

  def strong_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end
end
