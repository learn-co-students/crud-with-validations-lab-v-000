class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    if @song = Song.create(song_params)

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
    if @song.update(song_params)

      redirect_to song_path(@song)
    else

      render :edit
    end
  end

  def destroy
    Song.find(params[:id]).destroy

    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit!
  end
end




# <% @songs.each do |song| %>
#   <div class="song">
#     <p><span> <%= "#{song.title}, #{song.artist_name}, #{song.genre}, #{song.release_year}" %>
#     <%= link_to "Delete", song_path(song), method: :delete, data: {confirm: "Are you sure you want to delete this song?"} %> </span></p>
#   </div>
# <% end %>
