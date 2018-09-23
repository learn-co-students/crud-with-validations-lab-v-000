class TitleValidator < ActiveModel::Validator
  def validate(record)
    if Song.find(relaese_year: record.release_year, author_name: record.author_name, title: record.title).exists?
      record.errors[:title] << 'song already exists.'
    end
  end
end
