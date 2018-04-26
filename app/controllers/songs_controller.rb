class SongsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update]

  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @song.update(post_params)
    if @song.valid?
      redirect_to song_path(@song)
    else
      render :edit
    end

    def destroy
      Song.find(params[:id]).destroy
      redirect_to songs_path
    end
  end

  private

  def post_params
    params.permit(:title, :released, :release_year, :artist_name, :genre)
  end

  def set_post!
    @song = Song.find(params[:id])
  end
end
