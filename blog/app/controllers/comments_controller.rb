class CommentsController < ApplicationController
	before_action :find_article 
	def new
		@comment = @article.comments.new
	end
	def create
		@comment = @article.comments.build(comment_params)
		if @comment.save
			redirect_to article_path(@article), notice:"Create comment successfully"
		else
			render :new
		end
	end
	def edit
		@comment = @article.comments.find(params[:id])
	end
	def update
		@comment = @article.comments.find(params[:id])
		if @comment.update(comment_params)
			redirect_to article_path(@article), notice: "Edit comment successfully"
		else
			render :edit
		end
	end
	def destroy
		@comment = @article.comments.find(params[:id])	
		@comment.destroy
		redirect_to article_path(@article), alert: "Delete comment successfully"
	end
	private

	def find_article
		@article = Article.find(params[:article_id])
	end
	def comment_params
		params.require(:comment).permit(:content)
	end

end
