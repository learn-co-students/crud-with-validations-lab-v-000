class SongsController < ApplicationController
  before_action :current_song, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def song_param
    params.require(:song)
  end

  def current_song
    @song = Song.find_by(id: params[:id])
  end
end
