require 'date'

class Song < ActiveRecord::Base
 # include ActiveModel::Validations
  validates :title, presence: true
  # not the same year?
  validates :released, inclusion: { in: [true, false] }
  # optional y/n? if released
  validates :release_year, presence: true
  # , if :in_the_past?

  # def in_the_past?
  #   release_year < Date.today
  # end

end # Song
