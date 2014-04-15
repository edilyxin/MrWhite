class ArticlesController < ApplicationController
  def index
    @article_items = Article.paginate(page: params[:page])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save

    redirect_to new_article_path
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      flash[:success] = '更新成功'
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, notice: '删除成功'
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :image, :content)
  end
end
