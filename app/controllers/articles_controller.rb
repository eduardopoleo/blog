class ArticlesController < ApplicationController
  # http_basic_authenticate_with name: ENV['NAME'], password: ENV['PASSWORD'] , except: [:index, :show]

  def new
    @article = Article.new
    @articles = Article.all
  end

  def create
    respond_to do |format|
      format.html do
        @article = Article.new(article_params)
        @articles = Article.all
        if @article.save
          redirect_to @article
        else
          render 'new'
        end
      end

      format.json  do
        @article = Article.new(article_params)
        @article.save
        render json: ::ArticleSerializer.serialize(@article)
      end
    end
  end

  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html {
        @articles = Article.all
        render :show
      }

      format.json {
        render json: ::ArticleSerializer.serialize(@article, include: ['comments', 'categories'])
      }
    end
  end

  def index
    @articles = Article.all.order('created_at DESC').paginate(page: params[:page])
    @categories = Category.all

    respond_to do |format|
      format.html
      format.json {
        render json: ArticleSerializer.serialize(@articles, is_collection: true)
      }
    end
  end

  def edit
    @article = Article.find(params[:id])
    @articles = Article.all
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @articles = Article.all
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit!
  end
end
