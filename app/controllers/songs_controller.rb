class SongsController < ApplicationController
    before_action :songs, only: :index
  def index
  end

  def show
    @song = Song.find_by(params[:id])
  end

  def edit
    @song = Song.find_by(params[:id])
    render :form
  end

    def create
      @song = Song.new(song_params(:title, :artist_name, :release_year, :released, :genre))
      if @song.valid?
        @song.save
        redirect_to song_path(@song)
      else
        render :new
      end

    end

  private

  def song_params(*args)
    params.require(:song).permit(args)
  end

  def songs
      @songs = Song.all
  end

end
