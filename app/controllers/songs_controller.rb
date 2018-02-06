class SongsController < ApplicationController

  def index
    @songs = Song.all
  end  

  def show 
    @song = Song.find(params[:id])
  end 

  def new
    @song = Song.new
  end  

  def create 
    @song = Song.create(song_params(:title, :artist_name, :genre, :released, :release_year))
    if @song.valid?
       @song.save
      redirect_to song_path(@song)
    else
      render :new  
    end
  end 
  
  def edit 
    @song = Song.find(params[:id])
  end   

  def update 
    @song = Song.find(params[:id])
    if @song.update(song_params(:title))
      redirect_to song_path(@song)
    else
      render :edit
    end  

    def destroy 
      @song = Song.find(params[:id]).destroy
      redirect_to songs_url
      
    end  

  end   

private 

  def song_params(*args) 
    params.require(:song).permit(*args)
  end   

end
