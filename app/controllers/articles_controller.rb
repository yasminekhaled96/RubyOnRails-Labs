class ArticlesController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    #new method
    def new
        @article = Article.new
    end
    
    #index method -> to display all articles
    def index
        @articles = Article.all
    end

    #show method -> to display details of one article
    def show
        @article = Article.find(params[:id])
        # authorize! :read, @article
    end

    #edit method
    def edit
        @article = Article.find(params[:id])
    end

    #create method
    def create
        @article = Article.new(article_params)
        @article.user_id=current_user.id
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end

    #update method
    def update
        @article = Article.find(params[:id])
       
        if @article.update(article_params)
          redirect_to @article
        else
          render 'edit'
        end
    end

    #delete method
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
    
        redirect_to articles_path
    end
       
    private
    def article_params
        params.require(:article).permit(:title, :text)
    end

end
