1.Create a CRUD interface for Song 

2. Songs have title, a string
	cannnot be blank 
	cannot bre repeated by the same artist in the same year 
  Releasedd, a boolean, describes whether the song was officiailly released. 
  	must be tru eor false 

  Release_year, integer
  Optional if released is false 
  must not be bank if eleased is true 
  must be less than or qual to the current year .

  artist_name, string 
  	must not be blank 

  genre, a string


  3.Use resource gen, not sfaffold DONE


  Define a model with validations for Song. DONE, look up a fwe more 

Define all RESTful routes for songs. -- is this resources: song or something more? 

Build views that connect to each other using route helpers.

Use form_for to build forms with pre-fill and error list features. (Hint: Try using a partial to cut down on copypasting!)

Allow deleting songs with a link, using link_to. (HINT: You might need to add some functionality so that you can properly delete a song using just a link. Be sure to include your new assets in application.html.erb.)

Use strong parameters in your POST/PATCH controller actions.

Set the root route to the song index.