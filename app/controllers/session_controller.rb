class SessionController < ApplicationController

  get '/login' do
    if !logged_in?
      erb :'/sessions/login'
    else
      redirect '/reviews'
    end
  end

  post '/login' do
    @author = Author.find_by(email: params[:email])

    if @author and @author.authenticate(params[:password])
      session[:email] = @author.email
      redirect '/reviews'
    else
      erb :"/sessions/login"
    end
  end

  get '/logout' do
    logout
    redirect "/reviews"
  end
end
