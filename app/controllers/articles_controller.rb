class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def search
    @input = params[:title].downcase
    @result = Article.find_by(title: @input)
    if @result?
      redirect_to "articles/#{@result.id}"

    # puts "here is the result#{@result.title}"
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)
    @article.save
    redirect_to articles_path
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to action: "index"
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(params[:article])
    flash.notice = "Article '#{@article.title}' Updated!"
    redirect_to article_path(@article)
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
