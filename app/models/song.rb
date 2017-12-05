class Song < ActiveRecord::Base
    include ActiveModel::Validations
    validates :title, presence: true 
    validates_with MyValidator
end
