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

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)
    if @song.valid
      @song.save
      redirect_to song_path(@song)
    else 
      render :edit
    end
  end

  def destroy
  end

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])

  end

  private

  def song_params
    params.permit(:title, :release, :released_year, :artist_name, :genre)
  end

end



    

  