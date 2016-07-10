class TagsController < ApplicationController
  get '/tags' do
    @tags = Tag.all

    erb :'/tags/index'
  end


  get '/tags/:slug' do
    @tag = Tag.find_by_slug(params[:slug])

    erb :"/tags/show"
  end
end
