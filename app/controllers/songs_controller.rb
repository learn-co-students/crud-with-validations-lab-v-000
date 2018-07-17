class SongsController < ApplicationController
    before_action :songs, only: :index
  def index
  end

  def show
    @song = Song.find_by(params[:id])
  end

  def edit
    @song = Song.find_by(params[:id])
    render :_form
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

    def update
        @song = Song.find_by(params[:id])
      if  @song.update(song_params(:title, :artist_name, :release_year, :released, :genre))
        redirect_to song_path(@song)
      else
        render :edit
      end
    end

    def destroy
      @song = Song.find_by(params[:id])
      @song.destroy
      redirect_to songs_path
    end

  private

  def song_params(*args)
    params.require(:song).permit(args)
  end

  def songs
      @songs = Song.all
  end

end
