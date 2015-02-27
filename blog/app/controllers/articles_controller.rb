class ArticlesController < ApplicationController

 # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
 
  def index
    @articles = Article.all
    @user=User.find(session[:user_id])
    @comment = Comment.new
    @article = @user.articles.new
      if session[:user_id] != nil
        #@user = User.find(session[:user_id])
         @sessEmail = User.find(session[:user_id]).email
         @sessName = User.find(session[:user_id]).name
     
      else
        @sessEmail = "Guest"
        @sessName = "Guest"
      
      end
    
  end
 
def destroy
  @article = Article.find(params[:id])
  @article.destroy
 
  redirect_to articles_path
end   


  def show
    @article = Article.find(params[:id])
    Link.all.each do |l|
      if l.article_id = @article.id 
        Category.all.each do |c| 
          if c.id = l.category_id 
            @category = c 
          end 
        end 
      end 
    end 
 

  end

	def new 
	   
     @user = User.find(session[:user_id])
	   @article = @user.articles.new
     @comment = Comment.new
     @categories = Category.all

	end

	def create

    @comment = Comment.new
    @user = User.find(session[:user_id])
    
    @article = @user.articles.new(article_params)
    
    if @article.save
     
       redirect_to '/users/my_account'
       #redirect_to @article
       l = Link.new 
       l.category_id = params[:category_id] 
       l.article_id = @article.id 
       l.save 
    else 
	     render 'new'
    end
  end

 def update
    @article = Article.find(params[:id])
 
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
#end

def edit
    @article = Article.find(params[:id])
  end

 
private
  def article_params
    params.require(:article).permit(:title, :text)
  end


end




