#
# ? in the link_to for deleting a song in the show page, why are the examples
# online mentioning article_path(@article) routes in the link_to, when the
# delete line in rake routes is just blank in the path column?
#



#
# - edit form was having problems.
# -eventually it was found that find_by requires a hash. So passing in
# Song.find_by(params[:id]) was returning the wrong result, the song with id 1, instead of id 3.
# using .find worked. It's not clear why it grabbed a different song instead of just giving an error though.

# chain of events summary and arrow flow


# updating song
#
# you couldn't update a song because it wouldn't get past the @song.valid? check. But the coach
# said you could combine the update method and validity check- so just say
# if @song.update(song_params) etc, and obviate the need for a separate check. It was unclear
#   what exactly happened or exactly why the new code works. this seems to be more common in development than
#   i realized

-
# the missing template error was because it was looking for a destroy template. The other
# controllers get automatically read, but it was trying to implicitly render a destory view. bc
# i didn't specify a route to redirect to or a view to render. but in this case only redirect would
# make sense, bc just wshowing the view would be meaningless and throw an instance variable error wihtout
# access to all the songs
