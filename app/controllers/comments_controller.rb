class CommentsController < ApplicationController
	# http_basic_authenticate_with name: "Ali rido", password: "ali123", only: :destroy


	def create
		# binding.pry

		@article = Article.find(params[:article_id])
		comment = @article.comments.create(comment_params.merge(user_id: current_user.id))
		if comment.errors.any?
			# flash[:alert] = "Comment cannot post!"
			flash[:alert] = comment.errors.full_messages.join(", ")
		else 
			flash[:notice] = "Commented!"
		end
		redirect_to article_url(@article)
		# @comment = Comment.new(comment_params)
	end

	def destroy
		# @article = Article.find(params[:article_id])
		comment = Comment.find_by(article_id: params[:article_id], user_id: params[:user_id], id: params[:id])
		comment.destroy
		flash[:notice] = "Successfully deleted the comment!"
		redirect_to article_url(params[:article_id])
	end

	private
		def comment_params
			params.require(:comment).permit(:body)
		end
end