class SongsController < ApplicationController
  before_action :find_song!, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_path, notice: 'Song was successfully destroyed.' }
    end
  end

  private

  def song_params
    params.require(:song).permit(:title, :released, :year, :artist_name, :genre)
  end

  def find_song!
    @song = Song.find(params[:id])
  end
end
