class SongsController < ApplicationController
  def index # implicitly renders views/songs/index.html.erb view file to display all songs
    @songs = Song.all
  end

  def new # implicitly renders views/songs/new.html.erb view file (form to create a new song)
    @song = Song.new
  end

  def create
    @song = Song.new(song_params) # instantiate @song instance with its attributes set from strong params hash via mass assignment

    if @song.save # a song instance will only be saved to the DB (returning true) if all of its attributes are valid
      redirect_to song_path(@song) # go to show page that displays the song just created (the #show action will re-retrieve instance from DB again and store it using a different @song instance variable)
    else # otherwise, the @song instance could not be saved to DB (returning false) b/c it contains invalid attribute(s) and is therefore populated with errors
      render :new # render form to create a new song again, displaying error messages from the SAME @song instance
    end # at the top of the form (views/songs/new.html.erb view file)
  end

  def show # implicitly renders views/songs/show.html.erb view file (show page to display a single song)
    @song = Song.find(params[:id]) # find instance by its id attribute value (whatever replaces :id route variable in URL)
  end

  def edit # implicitly renders views/songs/edit.html.erb view file (form to edit song)
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id]) # find @song instance by its id attribute value (whatever replaces :id route variable in URL)
# update attribute values of @song instance from strong params via mass assignment
    if @song.update(song_params) # changes will only be saved to DB if values are valid; otherwise, #update returns false
      redirect_to song_path(@song) # redirect to show page that displays song just edited (in #show action, we re-retrieve instance and store it in different @song instance variable)
    else # otherwise, changes to @song could not be saved to DB due to invalid values and @song is therefore populated with errors
      render :edit # render form to edit song again, displaying errors from the same @song instance at top of form
    end
  end

  def destroy # find song instance by its id attribute value (whatever replaces :id route variable in URL)
    Song.find(params[:id]).destroy # and then immediately call #destroy on instance to delete it
    redirect_to songs_url # redirect to the index page, which displays all songs
  end

  private

    def song_params # calling this private method returns strong params
      params.require(:song).permit(:title, :release_year, :released, :genre, :artist_name)
    end
    # params hash must have top-level "song" key that points to (and stores) song hash nested inside of params hash
    # within song hash we only permit the keys "title", "release_year", "released", "genre" and "artist_name"
end
