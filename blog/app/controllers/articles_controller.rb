class ArticlesController < ApplicationController
	before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy] 
	def index
		@articles = Article.page(params[:page]).per(2)
	end
	def show
		@article = Article.find(params[:id])
		@comments = @article.comments
	end
	def new
		@article  = Article.new
	end
	def create
		@article = current_user.articles.create(article_params)
		if @article.save
			redirect_to articles_path, notice: "Create successfully"
		else
			render :new
		end
	end
	def edit
		@article = current_user.articles.find(params[:id])
	end
	def update
		@article = current_user.articles.find(params[:id])
		if @article.update(article_params)
			redirect_to articles_path, notice: "Edit successfully"
		else
			render :edit
		end
	end
	def destroy
		@article = current_user.articles.find(params[:id])
		@article.destroy
		redirect_to articles_path, notice: "Delete succesfully"
	end
	private
	def article_params
		params.require(:article).permit(:title, :content)
	end
end
