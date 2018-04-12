class SongsController < ApplicationController
  before_action :set_song, except: [:index, :create, :new]


  def index
    @songs = Song.all
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

  def show

  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private

  def set_song 
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end

end
