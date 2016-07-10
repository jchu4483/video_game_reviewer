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


  get '/authors/:slug' do
    @author = Author.find_by_slug(params[:slug])

    erb :"/authors/show"
  end

  get '/authors' do
    @authors = Author.all

    erb :"/authors/index"
  end

end
