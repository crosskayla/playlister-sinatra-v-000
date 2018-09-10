class Song < ActiveRecord::Base
  has_many :artists
  has_many :genres, through: :songs
end
