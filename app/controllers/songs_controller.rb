class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def show
        @song = Song.find_by(:id => params[:id])
    end


    def create
        @song = Song.new(song_params(:title, :artist_name, :genre, :released))
        if @song.valid? && not_released_this_year(params)
            @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def edit
        @song = Song.find_by(:id => params[:id])
    end

    def update
        @song = Song.find_by(:id => params[:id])
        @song.assign_attributes(song_params(:title, :artist_name, :genre, :released, \
            :release_year, :artist_name))
        if @song.valid? && not_released_this_year
            @song.save
            redirect_to song_path(@song)
        else
            render :edit
        end
    end

    def destroy
        Song.find_by(:id => params[:id]).destroy
        redirect_to songs_path
    end

    def song_params(*args)
        params.require(:song).permit(*args)
    end

    helpers do
    private
        def not_released_this_year(params)
            @song = Song.find_by(:artist_name => params[:artist_name], \
                :release_year => params[:release_year], \
                :title => params[:title])
            @song.nil?
        end
    end
end
