class SongsController < ApplicationController
  before_action :set_song!, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    # puts "create song : #{params}"
    # NOTE : Creating using song_params isn't working for some reason (song_params = nil)
    @song = Song.new
    @song.title = params["song"]["title"]
    @song.released = params["song"]["released"]
    @song.artist_name = params["song"]["artist_name"]
    @song.release_year = params["song"]["release_year"]
    @song.genre = params["song"]["genre"]

    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    # puts "update song : #{params} || #{song_params}"
    # NOTE : Creating using song_params isn't working for some reason (song_params = nil)
    @song.title = params["song"]["title"] if params["song"].include?("title")
    @song.released = params["song"]["released"] if params["song"].include?("released")
    @song.artist_name = params["song"]["artist_name"] if params["song"].include?("artist_name")
    @song.release_year = params["song"]["release_year"] if params["song"].include?("release_year")
    @song.genre = params["song"]["genre"] if params["song"].include?("genre")

    if @song.save
      puts "updated song successfully"
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_url
  end


  def song_params
    params.permit(:title, :released, :artist_name, :release_year, :genre)
  end

  def set_song!
    @song = Song.find(params[:id])
  end

end

# rspec spec/controllers/songs_controller_spec.rb

# Referenced Labs #
# validations-in-controller-actions-rails-lab-v-000
# validations-with-form_for-rails-v-000
# delete-forms-rails-v-000
