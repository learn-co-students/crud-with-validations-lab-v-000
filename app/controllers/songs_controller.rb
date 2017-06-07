class SongsController < ApplicationController
  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def edit
    @song = Song.find(params[:id])
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect song_path(@song)
    else
      render :new
    end
  end

  def update
    @song = Song.find(params[:id])
     @song.update(song_params)
     if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to song_path(@song)
  end

  private

  def song_params
    params.permit(:title, :released, :release_year, :artist_name)
  end
end

#rails g model Song title:string author_name:string released:boolean release_year:integer
