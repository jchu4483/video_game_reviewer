require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :sessions_secret, "authentication_sinatra"
  end

  get "/" do
    redirect "/signup"
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def logout
      session.clear
    end

    def current_user
      @current_user ||= Author.find_by(:email => session[:email]) if session[:email]
    end

  end

end
