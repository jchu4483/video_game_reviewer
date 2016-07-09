class ReviewController < ApplicationController
  get '/reviews' do
    @reviews = Review.all
    erb :'reviews/index'
  end

  get '/reviews/new' do
    if !logged_in?
      @author = Author.new
      erb :'/sessions/login'
    else
      @post = Post.new
      erb :'/reviews/new'
    end
  end

  post '/reviews' do
    @review = Review.new(params[:review])
    @review.author = current_user
    if @review.save
      redirect "/reviews/#{@review.slug}"
    else
      erb :'/review/new'
    end
  end

  get '/reviews/:slug' do
    @review = Review.find_by_slug(params[:slug])
    erb :'/reviews/show'
  end


end
