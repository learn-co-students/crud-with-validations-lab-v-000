class MyValidator < ActiveModel::Validator
  def validate(song)
    unless song.author_name.unique? | song.release_year.unique?
        song.errors[:title] << 'false'
    end
   end
 end
