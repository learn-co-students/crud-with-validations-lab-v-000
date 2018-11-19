class SongsController < ActionController::Base

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_attributes)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_attributes)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_path
  end

  def show
    @song = Song.find(params[:id])
  end

  def index
    @songs = Song.all
  end

  private

  def song_attributes
    params.require(:song).permit(:title, :artist_name, :release_year, :released, :genre)
  end
end
