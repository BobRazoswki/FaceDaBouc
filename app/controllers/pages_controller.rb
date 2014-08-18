class PagesController < ApplicationController

	def index
		@article = Article.new
	end

end
