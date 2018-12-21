class SongsController < ApplicationController
  def show
    @song = Song.find(params[:id])
  end

  def index
    @songs = Song.all
    render :index
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(title: params[:song][:title], released: params[:song][:released],release_year: params[:song][:release_year], artist_name: params[:song][:artist_name], genre: params[:song][:genre])
    if @song.save
    redirect_to song_path(@song)
  else
    render :new
  end
  end

  def edit
    @song = Song.find_by(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(title: params[:song][:title])
    if @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_url
  end

end
