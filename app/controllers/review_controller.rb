require 'rack-flash'
class ReviewController < ApplicationController
  use Rack::Flash

  get '/reviews' do
    @reviews = Review.all
    erb :'reviews/index'
  end

  get '/reviews/new' do
    if !logged_in?
      @author = Author.new
      erb :'/sessions/login'
    else
      @tags = Tag.all
      @review = Review.new
      erb :'/reviews/new'
    end
  end

  post '/reviews' do
    @review = Review.new(params[:review])
    @review.author = current_user
    @review.save
    if @review.save
      flash[:message] = "Successfully created a new review."
      redirect "/reviews/#{@review.slug}"
    else
      erb :'/reviews/new', locals: {message: "Oops! Something went wrong. Please try again."}
    end
  end

  get '/reviews/:slug' do
    @review = Review.find_by_slug(params[:slug])
    erb :'/reviews/show'
  end

  get '/reviews/:slug/edit' do
    @review = Review.find_by_slug(params[:slug])
    if !logged_in?
      redirect '/login'
    else
      if @review = current_user.reviews.find_by_slug(params[:slug])
        erb :"/reviews/edit"
      else
        redirect '/reviews'
      end
    end
  end

  patch "/reviews/:slug" do
    @review = Review.find_by_slug(params[:slug])
    @review.update(params[:review])

    redirect "/reviews/#{@review.slug}"
  end

  delete "/reviews/:slug/delete" do
    @review = Review.find_by_slug(params[:slug])

    if !logged_in?
      redirect "/login"
    else
      if review = current_user.reviews.find_by_slug(params[:slug])
        @review.delete
        "Your review has been deleted"
      else
        redirect "/reviews"
      end
    end
  end

end
