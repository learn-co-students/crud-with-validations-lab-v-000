class SongsController < ApplicationController
  before_action :set_song!, only: [:show, :edit, :update, :delete]

  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.create
  end

  def create
    @song = Song.new(params_permitter(:title, :artist_name, :genre, :released, :release_year))
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
    if @song.update(params_permitter(:title, :artist_name, :genre, :released, :release_year))
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def delete
  end

    private

    def set_song!
      @song = Song.find(params[:id])
    end

    def params_permitter(*args)
      params.require(:song).permit(*args)
    end

end
