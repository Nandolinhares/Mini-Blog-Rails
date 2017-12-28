class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "Categoria criada com sucesso"
      redirect_to categories_path
    else
      renderiza (:new)  
    end

  end

  def update
    if @category.update category_params
      flash[:notice] = "Categoria atualizada com sucesso"
      redirect_to categories_path
    else
      renderiza(:edit)      
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'A categoria foi deletada!' }
      format.json { head :no_content }
    end
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end
    def renderiza(view)
      render view
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
