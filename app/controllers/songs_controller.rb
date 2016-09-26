class SongsController < ApplicationController
	def index
		@songs = Song.all
	end

	def show
    @song = Song.find(params[:id])
  end

  def new
  	@song = Song.new(song_params)
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect song_path(@song)
    else
      render :new
    end
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
  end

  private

  def song_params
    params.permit(:title, :released, :release_year, :released, :artist_name, :genre)
  end
end
