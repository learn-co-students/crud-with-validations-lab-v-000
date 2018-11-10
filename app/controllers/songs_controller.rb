class SongsController < ApplicationController

  def index

    @song = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.invalid?
      render :new
    else
      @song = Song.create!(song_params)
    redirect_to song_path(@song)
    end
  end

  def show
    @song = Song.find_by_id(:id)
    binding.pry
  end

  def edit
      @song = Song.find_by_id(:id)
  end
  private

    def song_params
      params.require(:song).permit(:title,:released, :release_year, :genre, :artist_name)
    end
end
