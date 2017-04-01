class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end
	def show
		
	end
	def new
		@article  = Article.new
	end
	def create
		@article = Article.create(article_params)
		if @article.save
			redirect_to articles_path
		else
			render :new
		end
	end
	def edit
	end
	def update
	end
	def destroy
	end
	private
	def article_params
		params.require(:article).permit(:title,:content)
	end
end
