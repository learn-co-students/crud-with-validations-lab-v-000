class SongsController < ApplicationController
   before_action :set_song, only: [:show, :edit, :update, :destroy]
  def index
    @songs = Song.all
  end

  def show

  end

  def edit
    
  end
  
  def new
    @song = Song.new
  end

  def create
    binding.pry
    @song = Song.new(song_params)
    if @song.save
       redirect_to song_path(@song)
    else
      render :new
    end
  end
  # def update

  # end

  private

  def song_params
    params.permit(:title, :released, :released, :artist_name, :genre)
  end

  def set_song
    @song = Song.find(params[:id])
  end
end
