class CommentsController < ApplicationController
  before_action :authenticate_user!, :set_article

  def create
    @article = Article.find(params[:article_id])
    comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    comment = @article.comments.find(params[:id])
    comment.destroy!
    redirect_to article_path(@article), status: :see_other
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end

    def set_article
      @article = Article.find(params[:article_id])
    end
end
