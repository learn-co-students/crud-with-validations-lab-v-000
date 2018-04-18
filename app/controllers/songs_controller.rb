class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
    @http_method = "post"
    @submit_button = "Create New Song"
    render "new", layout: "form_layout"
  end

  def create
    @song = Song.new(post_params)
    if @song.valid?
        @song.save
        redirect_to song_path(@song)
    else
        render "new", layout: "form_layout"
    end
  end

  def show
    @song = Song.find_by(params[:id])
  end

  def edit
    @http_method = "patch"
    @submit_button = "Update Song"
    @song = Song.find_by(params[:id])
    render "edit", layout: "form_layout"
  end

  def update
    @song = Song.find_by(params[:id])
    @song.update(post_params)
    if @song.valid?
        @song.save
        redirect_to song_path(@song)
    else
        render "edit", layout: "form_layout"
    end
  end

  def destroy
    @song = Song.destroy(params[:id])
    redirect_to songs_path
  end

  def post_params
    params.require(:song).permit(:title, :artist_name, :released, :release_year, :artist_name, :genre)
  end

end
