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
        @song = Song.new
        @song.title = params[:song][:title]
        @song.released = params[:song][:released]
        @song.release_year = params[:song][:release_year]
        @song.artist_name = params[:song][:artist_name]
        @song.genre = params[:song][:genre]
        # binding.pry
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
        @song.title = params[:song][:title]
        # @song.released = params[:song][:released]
        # @song.release_year = params[:song][:release_year]
        # @song.artist_name = params[:song][:artist_name]
        # @song.genre = params[:song][:genre]
    #    binding.pry
        if @song.valid? 
          @song.save
          redirect_to song_path(@song)
        else
          render :edit
        end
    end

    def destroy
        @song = Song.find(params[:id])
        # @song.title = params[:song][:title]
        # binding.pry
        @song.destroy
        redirect_to songs_path
    end

end
