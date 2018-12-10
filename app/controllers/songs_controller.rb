class SongsController < ApplicationController
    before_action :set_song!, only: [:show, :update, :edit]

    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new
        if @song.valid?
            @song.save
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
    end

private

    def song_params
        params.permit
    end

    def set_song!
        @song = Song.find(params[:id])
    end

end
