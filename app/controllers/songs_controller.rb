class SongsController < ApplicationController

def index
  @songs = Song.all
end

def new
  @song = Song.new
end

def create
  @song = Song.new(post_params)

  if @song.save
    @song.save
    redirect_to song_path(@song)
  else
    render :new
  end
end

def edit
  @song = Song.find_by_id(params[:id])
end

def update
  @song = Song.find_by_id(params[:id])

  if @song.update(post_params)
    @song.update(post_params)
    redirect_to song_path(@song)
  else
    render :edit
  end
end

def show
  @song = Song.find_by_id(params[:id])
end

def destroy
  Song.find(params[:id]).destroy
  redirect_to songs_url
end

private

def post_params
  params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
end

end
