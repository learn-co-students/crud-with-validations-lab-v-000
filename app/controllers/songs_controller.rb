class SongsController < ApplicationController

 def index
     @songs = Song.all
 end
 
 def new
    @song = Song.new
 end

 def show
    @song = Song.find(params[:id])
 end

 def create
    @song = Song.new(title: params[:title], released: params[:released], release_year: params[:release_year], artist_name: params[:artist_name], genre: params[:genre])
  if @song.valid?
    @song.save
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
    @song.update(params.require(:song).permit(:title, :artist))
    if @song.valid?
    redirect_to song_path(@song)
    else
    render :edit
    end
  end

  def destroy
      Songs.find(params[:id]).destroy
      redirect_to song_url
  end

  def errors_message
   errors.add(:title, "Title can't be blank")
   errors.add(:released, "Must be True or False")
   errors.add(:artist_name, "Artist name can't be blank")
   errors.add(:release_year, "Must be less than or equal to current year")
  end

  private

  def song_params
    params.permit(:title, :released, :release_year, :artist_name)
  end
end
