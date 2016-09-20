class ArticlesController < ApplicationController
	include ArticlesHelper
	before_filter :require_login, only: [:new, :create, :edit, :update, :destroy]

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
		@comment = Comment.new
		@comment.article_id = @article.id
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@article.save
		flash.notice = "Straipsnis '#{@article.title}' Sukurtas!"
		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash.notice = "Straipsnis '#{@article.title}' Ištrintas!"
		redirect_to articles_path
	end

	def edit 
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)
		flash.notice = "Straipsnis '#{@article.title}' Atnaujintas!"
		redirect_to article_path(@article)
	end
end
