require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

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

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.name = params[:song][:name]
  end

  post '/songs' do
    # binding.pry
    @song = Song.create(name: params[:song][:name])
    @song.artist = Artist.find_or_create_by(name: params[:song][:artist])

    params[:song][:genres].each do |genre_id|
      genre = Genre.find(genre_id)
      @song.genres << genre if genre
    end
    @song.save

    flash[:message] = "Successfully created song."
    redirect ("/songs/#{@song.slug}")

  end

end
