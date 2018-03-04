class SongsController < ApplicationController
  
 def show
    @song = Song.find(params[:id])
 end

  def edit
     @song = Song.find(params[:id])
  end

  def update
     @song = Song.find(params[:id])
    @song.update(Song_params)
    if @song.valid?
    redirect_to Song_path(@song)
    else
    render :edit
    end
  end
  
  def destroy
      Songs.find(params[:id]).destroy
      redirect_to song_url

  private

  def Song_params
    params.permit(:title, :category, :content)
  end
end
end
