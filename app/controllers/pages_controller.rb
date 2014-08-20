class PagesController < ApplicationController

	def index
		@new_article = Article.new
		@articles = Article.all
	end

end
