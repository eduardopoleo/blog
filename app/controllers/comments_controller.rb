class CommentsController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
  before_action :find_article

  def create
    @comment = @article.comments.create(comment_params)

    respond_to do |format|
      format.html { redirect_to article_path(@article) }
      format.json { render json: ::CommentSerializer.serialize(@comment) }
    end
  end

  def index
    render json: ::CommentSerializer.serialize(@article.comments.reverse, is_collection: true)
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

  def find_article
    @article = Article.find(params[:article_id])
  end
end
