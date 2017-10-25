class SongsController < ApplicationController
  before_action :set_song!, only: [:show, :edit, :update]

  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def update
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    set_song!
    @song.destroy
    redirect_to songs_path
  end


  private
    def set_song!
      @song = Song.find(params[:id])
    end

    def song_params
      params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end

    def true?(obj)
      obj.to_s == "true"
    end

end

# def post_params # a bit inflexible, can't do, create two fields, only allow to fix 1.
# 	params.require(:post).permit(:title, :description)
# end
