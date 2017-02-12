class SongsController < ApplicationController
     before_action :set_song!, only: [:show, :edit, :update]

    def index
    end

    def show
    end

    def create
    end

    def edit
    end

    def update
      @song.update(song_params)
      if @song.valid?
        redirect_to song_path(@song)
      else
        render :edit
      end
    end

    def destroy
    end

  private

    def song_params
      params.permit(:title, :released, :release_year, :artist_name, :genre)
    end

    def set_song!
      @song = Song.find(params[:id])
    end
end
