class ArticlesController < ApplicationController
  http_basic_authenticate_with name: ENV['NAME'], password: ENV['PASSWORD'] , except: [:index, :show]
  
  def new
    @article = Article.new
    @articles = Article.all
  end
  
  def create
    @article = Article.new(article_params)
    @articles = Article.all
    if @article.save
      redirect_to @article
    else
      render 'new'
    end 
  end
  
  def show
    @article = Article.find(params[:id])
    @articles = Article.all
  end

  def index
    @articles = Article.all.order('created_at DESC').paginate(page: params[:page], per_page: 5 )
    @categories = Category.all
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
