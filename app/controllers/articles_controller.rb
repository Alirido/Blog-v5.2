class ArticlesController < ApplicationController
	# http_basic_authenticate_with name: "Ali rido", password: "ali123", except: [:index, :show]
	before_action :authenticate_user!, except: [:index, :show]
	before_action :ensure_admin_user!, only: [:edit, :destroy, :update]

	def index
		@article = Article.order(:title).page(params[:page])
	end

	def show
		@article = Article.find(params[:id])
		# @comments = Comment.where(article_id: params[:article_id])
	end

	def new
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	def create
		@article = Article.new(article_params)
		@article.user_id = current_user.id
 
  		if @article.save
  			flash[:notice] = "Article has successfully posted!"
  			redirect_to article_url(@article)
  			# , notice: "Article has successfully posted!" # redirect_to article_url(article)
  		else
  			flash[:alert] = "Cannot save article."
  			render 'new'
  			# , alert: "Cannot save the article."
  		end
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			flash[:notice] = "Successfully edited the article!"
			redirect_to article_url(@article)
		else
			flash[:notice] = "Cannot edit the article!"
			render 'edit'
		end
	end

	def destroy
		article = Article.find(params[:id])
		article.destroy
		flash[:notice] = "Successfully deleted the article"
		redirect_to articles_url
	end

	def ensure_admin_user!
		unless current_user && current_user.role.name == "Admin"
			redirect_to articles_url, alert: "Access denied!"
		end
	end

	private
		def article_params
			params.require(:article).permit(:title, :text)
		end
end
