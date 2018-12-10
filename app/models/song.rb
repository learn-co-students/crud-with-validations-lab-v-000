class Song < ActiveRecord::Base
  #Check that a title has been provided.
   validates :title, presence: true
   #Check that title + release_year + artist_name is unique
   validates :title, uniqueness: {
    scope: %i[release_year artist_name]}
   #Checks that the values true or false or included within the :released attribute
    validates :released, inclusion: { in: [true, false] }
   #with_options is a easy way to group conditionals
   with_options if: :released? do |song|
      #all of these validations only apply if released? is evaluated as true
      song.validates :release_year, presence: true
      #numericality validates that the attribute only has numeric values.
      song.validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}
   end

   def released?
     released
   end

end
