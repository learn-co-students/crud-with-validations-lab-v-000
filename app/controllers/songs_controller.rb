class SongsController < ApplicationController

  def index 
     @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    #byebug
    @song = Song.new(song_params) #.new because create presaves
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

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song.update(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end
    
  end


  private

  def song_params
    params.permit(:title,:released,:release_year,:artist_name,:genre)
  end
end
