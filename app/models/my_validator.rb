class MyValidator < ActiveModel::Validator
  def validate(song)
    unless song.author_name.unique? && song.release_year.unique?
      unless post.title.include? "Won't Believe"
        post.errors[:title] << 'false'
      end
   end
 end
end
