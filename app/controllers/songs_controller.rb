class SongsController < ApplicationController

  get '/songs' do
    erb :"/songs/index"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    if @song
      erb :"/songs/show"
    end
  end

end
