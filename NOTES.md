Create a thorough CRUD interface for one model, the Song.

SONGS
Songs have the following attributes and limitations:

[] title, a string
[] Must not be blank
[] Cannot be repeated by the same artist in the same year
released, 
[] a boolean describing whether the song was ever officially released.
[] Must be true or false
[] release_year, an integer
[] Optional if released is false
[] Must not be blank if released is true
[] Must be less than or equal to the current year
[] artist_name, a string
[] Must not be blank
[] genre, a string

REQUIREMENTS
[] Use the resource generator, not the scaffold generator.

[] Define a model with validations for Song.
[] Define all RESTful routes for songs.
[] Build views that connect to each other using route helpers.
[] Use form_for to build forms with pre-fill and error list features. (Hint: Try using a partial to cut down on copypasting!)
[] Allow deleting songs with a link, using link_to. (HINT: You might need to add some functionality so that you can properly delete a song using just a link. Be sure to include your new assets in application.html.erb.)
[] Use strong parameters in your POST/PATCH controller actions.
[] Set the root route to the song index.

