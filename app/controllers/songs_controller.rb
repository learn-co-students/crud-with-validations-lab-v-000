class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    # binding.pry
    @song = Song.new(song_params(params[:song].keys))
    if @song.valid?
       @song.save
      #  render :show
      redirect_to song_path(@song)
    else
       render :new
    end
  end

  def show
    # binding.pry
    @song = Song.find(params[:id])
  end


  def edit
    @song = Song.find_by(id: params[:id])
  end


  def update
    @song = Song.find(params[:id])
    if @song.update(song_params(params[:song].keys))
      redirect_to @song
    else
      render :edit
    end
  end



  def destroy
    # binding.pry
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to songs_path
  end
# if we render the index, it won't work because it would just take you to the view itself and
# you wouldn't access the list of songs. it would probably just show an




private

  def song_params(*args)
    params.require(:song).permit(*args)
  end

end
