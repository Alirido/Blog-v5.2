class CommentsController < ApplicationController
	http_basic_authenticate_with name: "Ali rido", password: "ali123", only: :destroy

	def create
		# binding.pry
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(comment_params)
		if @comment.errors.any?
			flash[:error] = "Cannot make comment."
		else 
			flash[:success] = "Success."
		end
		redirect_to article_url(@article)
		# if @comment.errors.any?
		# 	# render "articles/show"
		# 	redirect_to article_url(@article)
		# else 
		# 	redirect_to article_url(@article)
		# end
	end

	def destroy
		# @article = Article.find(params[:article_id])
		comment = Comment.find_by(article_id: params[:article_id], id: params[:id])
		comment.destroy
		redirect_to article_url(params[:article_id])
	end

	private
		def comment_params
			params.require(:comment).permit(:commenter, :body)
		end
end