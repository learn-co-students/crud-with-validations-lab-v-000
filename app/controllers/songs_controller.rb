class SongsController < ApplicationController

  def index

    @song = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new
    if @song.invalid?
      render :new
    else
      @song = Song.create!(post_params(:title,:released, :release_year, :genre, :artist_name))
    redirect_to song_path(@song)
    end
  end

  def show
    @song = Song.find_by_id(:id)
  end

  def edit
      @song = Song.find_by_id(:id)
  end
  private

    def post_params(*args)
      params.require(:song).permit(*args)
    end
end
