class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    x = self.name.split(' ').join('-')
    binding.pry
  end

end
