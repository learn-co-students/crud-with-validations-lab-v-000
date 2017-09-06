class SongAlreadyReleasedValidator < ActiveModel::Validator
  def validate(record)
  	if record.id.nil?
	  	unless Song.where("title = ? and artist_name = ? and release_year = ?", record.title, record.artist_name, record.release_year).empty?
	  		record.errors[:song] << 'artist cannot release the same song in the same year more than once'
		end
	else 
		unless Song.where("title = ? and artist_name = ? and release_year = ?", record.title, record.artist_name, record.release_year).size < 2
			record.errors[:song] << 'artist cannot release the same song in the same year more than once'
		end
	end
  end
end