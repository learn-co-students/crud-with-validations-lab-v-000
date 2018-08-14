class SongsController < ApplicationController


    def index
        @songs = Song.all
    end

    def new
    
     @song = Song.find(params[:id])
    
    end

    def show
        @song = Song.find(params[:id])
    end

    def edit
        @song = Song.find(params[:id])
    end


    def update
        @song = Song.find(params[:id])
        @song.update(song_params)
        redirect_to song_path(@song)
    end
    
    def create
        @song = Song.new(song_params)
        #  if @song.valid?  #true
        #   @song.save
        #  redirect_to song_path(@song)
        # else
           render :new
        # end
    end
    
  
    #it wants a destroy action.


    private

    def song_params
        params.permit(:artist_name, :title, :genre,:released, :release_year)

    end

end
