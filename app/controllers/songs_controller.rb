class SongsController < ApplicationController

  get '/songs' do
    erb :"/songs/index"
  end

  get '/songs/:id' do
    @song = Song.find(params[:id])
    if @song
      erb :"songs/show"
    end
  end

end
