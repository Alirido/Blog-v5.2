class ArticlesController < ApplicationController
	http_basic_authenticate_with name: "Ali rido", password: "ali123", except: [:index, :show]

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
 
  		if @article.save
  			flash[:success] = "Article saved."
  			redirect_to article_url(@article) # redirect_to article_url(article)
  		else
  			flash[:error] = "Cannot save article."
  			render 'new' 
  		end
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to article_url(@article)
		else
			render 'edit'
		end
	end

	def destroy
		article = Article.find(params[:id])
		article.destroy

		redirect_to articles_url
	end

	private
		def article_params
			params.require(:article).permit(:title, :text)
		end
end
