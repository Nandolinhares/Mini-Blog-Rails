class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

 
  def edit
    @categories = Category.all
    renderiza(:edit)
  end 

  def create
    @post = Post.new(post_params)
  
    if @post.save
      flash[:notice] = "Post criado com sucesso"
      redirect_to posts_path
    else
      renderiza (:new)  
    end
  end

  def update
    if @post.update post_params
      flash[:notice] = "Post atualizado com sucesso"
      redirect_to posts_path
    else
      renderiza(:edit)      
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end
    def renderiza(view)
      render view
    end

    def post_params
      params.require(:post).permit(:name, :description, :body, :category_id)
    end
end
