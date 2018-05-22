class SongsController < ApplicationController
    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def edit
        @song = Song.find(params[:id])
    end

    def show
        @song = Song.find(params[:id])
        # raise params.inspect
    end

    def create
        @song = Song.new(song_params)
        # binding.pry
        if @song.valid?
            @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def update
        @song = Song.find(params[:id])
        @song.update(song_params)
        if @song.valid?
            @song.save
            redirect_to song_path(@song)
        else
            render :edit
        end
    end

    def destroy
        @song = Song.find(params[:id]).destroy
        redirect_to songs_url
        #needed to be redirected ... and didn't need to explicitly indicate index view ... for needed template to be rendered from error
    end

    private

    def song_params
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
        #need key of song that permits all the attributes, form_for in new view makes hash that needs the require method in this instance mthod 
    end
end
