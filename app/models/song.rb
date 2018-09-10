class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :genres
  has_many :user_songs
end
