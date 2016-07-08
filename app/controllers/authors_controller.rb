class AuthorsController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'authors/new'
    else
      redirect '/reviews'
    end
  end

  post '/signup' do
    @author = Author.new(params)
    if @author.save
      session[:id] = @author.id
      redirect '/login'
    else
      erb :'authors/new'
    end
  end





end
