class SessionController < ApplicationController

  get '/login' do
    if !logged_in?
      @author = Author.new
      erb :'/sessions/login'
    else
      redirect '/reviews/index'
    end
  end

  post '/login' do
    @author = Author.find_by(email: params[:email])

    if @author and @author.authenticate(params[:password])
      session[:email] = @author.email
      erb :'/reviews/index'
    else
      erb :"/sessions/login"
    end
  end

  get '/logout' do
    logout
    redirect "/reviews"
  end
end
