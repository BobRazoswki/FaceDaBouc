class ArticlesController < ApplicationController

	before_action :authenticate_user!, except: [:index]

include ArticlesHelper

	def index
		@new_article = Article.new
		@articles = Article.all
	end

	def create
		@new_article = Article.new(params[:article].permit(:title, :content, :picture, :tag_list))
		#@article = Article.create(article_params)
		@new_article.save 
		redirect_to('/') 
	end

end
