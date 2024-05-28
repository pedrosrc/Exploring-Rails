class ArticlesController < ApplicationController
  before_action :authenticate_user!, :set_article, only: %i[ show edit update destroy ]

  def index
    @articles = Article.all
  end

  def show

  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit

  end

  def update
    if article.update(article_params)
      redirect_to article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    article.destroy

    redirect_to root_path, status: :see_other
  end

  private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
end
