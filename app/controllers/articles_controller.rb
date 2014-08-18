class ArticlesController < ApplicationController

	#before_action :authenticate_user!, except: [:index]

include ArticlesHelper

	def index
		@article = Article.all
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.create(article_params)
		@article.save ? redirect_to('/') : render('articles/_article_form')
	end

end
