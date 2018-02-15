class SongsController < ApplicationController
  before_action :set_song!, only: [:show, :edit, :update, :destroy]
        def index
            @songs = Song.all
        end
        def show
            #set above
        end

        def new
                 @song = Song.new
        end

        def create
#                  puts params.inspect
                  @song = Song.new(song_params)

                  if @song.valid?  #if validations work
                      @song.save
                      redirect_to song_path(@song)
                  else
                      render :new
                  end
        end
        def edit
          #set above
        end
        def update
  #binding.pry          #set above
            if @song.update(song_params)
            #if validations work, you could have also used the following if using *args ---    @song.update(song_params(:title, :released, :release_year, :artist_name, :genre))
                  redirect_to song_path(@song)
            else
                  render :edit  #keeps the error messages associated to @song after trying to persist to db
            end
        end

        def destroy
          @song.destroy
          redirect_to songs_path
        end

        private
          #strong params
        def song_params
                params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)

        end

#        def song_params(*args)
#                params.require(:song).permit(*args)
#        end
          #making things easier without repetitive code
          #before uptop
        def set_song!
                  @song = Song.find(params[:id])
        end
end
