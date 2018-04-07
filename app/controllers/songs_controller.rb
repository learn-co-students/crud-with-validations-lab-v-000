class SongsController < ApplicationController
  def new
    @song= Song.new
  end
def create
  @song=Song.new(params.require(:song).permit(:artist_name,:genre,:title,:released,:release_year))
  if @song.valid?
    @song.save
    redirect_to @song
  else
    render :new
  end
end
def edit
  @song= Song.find(params[:id])

end
def update
  @song= Song.find(params[:id])
  if @song.update(params.require(:song).permit(
      :title, :release_year, :released, :genre, :artist_name
))
    redirect_to @song
  else
    render :edit
  end

end
def show
  @song= Song.find(params[:id])
end
def index
  @songs= Song.all
end
def destroy
  @song= Song.find(params[:id]).destroy
  redirect_to songs_path
end
end
