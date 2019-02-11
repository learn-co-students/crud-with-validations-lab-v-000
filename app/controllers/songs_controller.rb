class SongsController < ApplicationController

  def new
    @song = Song.new(song_params)
  end

  def create
    @song = Song.new(song_params)

    if @song.save 
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
    @song.update(song_params)

    if @song.save 
      redirect_to song_path(@song)
    else 
      render :edit
    end
    
  end

  def delete

  end

  def song_params
    params.permit(:title, :artist_name, :released, :release_year, :genre )
  end

end
