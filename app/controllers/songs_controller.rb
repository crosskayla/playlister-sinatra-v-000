class SongsController < ApplicationController

  get '/songs' do
    erb :"/songs/index"
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/show"
  end

  post '/songs' do
    # binding.pry
    @song = Song.create(name: params[:song][:name])
    @song.artist = Artist.find_or_create_by(name: params[:song][:artist])

    params[:song][:genre].each do |genre_id|
      genre = Genre.find(genre_id)
      song.genres << genre if genre
    end

    @song.save
    redirect ("/songs/#{@song.slug}")

  end

end
