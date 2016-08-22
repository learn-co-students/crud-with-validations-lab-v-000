class SongsController < ApplicationController
  before_action :find_song!, only: [:show, :edit, :update, :destroy]
  before_action :make_fields!, only: [:edit, :new, :create, :update]

  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def edit
  end

  def create
    @song = Song.new(s_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def update
    if @song.update(s_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private

  def find_song!
    @song = Song.find_by(id: params[:id])
  end

  def make_fields!
    @fields = {
      title: :text_field,
      released: :check_box,
      release_year: :number_field,
      artist_name: :text_field,
      genre: :text_field
    }
  end

  def s_params
    params.require(:song).permit(:title, :released, :release_year, :genre, :artist_name)
  end
end
