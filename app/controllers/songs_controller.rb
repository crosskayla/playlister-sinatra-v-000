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
    @song = Song.create(params[:song][:name])
    params[:song][:genre].each do |genre_id|
      Genre.find(genre_id)
    end
    @artist = Artist.find_by(name: params[:song][:artist])
    if @artist
      @song.artist = @artist
    else
      @artist = Artist.create(name: params[:song][:artist])
      Song.create()
    end
  end

end
