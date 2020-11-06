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
        @song = Song.new(post_params)
         if @post.save
            redirect_to post_path(@post)
        else
            render :new
        end
    end



    private

    def post_params
        params.permit(:title, :released, :release_year, :artist_name, :genre)
    end

end
