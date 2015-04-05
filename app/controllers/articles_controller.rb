class ArticlesController < ApplicationController
  def index     
    @articles = Article.all
  end

  def new
    @article = Article.new
  end
  
  def edit
  end
  
  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:notice] = "Article was deleted successfully."
    else
      flash[:notice] = "There was an error deleting article."
      render :index
    end
  
  
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
  
  def show
    @article = Article.find(params[:id])
  end
   
  private
  def article_params
    params.require(:article).permit(:title, :content)
  end
end
