class SongsController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to songs_path
  end



  private

  def song_params
    params.require(:song).permit(:title, :release_year, :released, :genre, :artist_name)
  end
end
