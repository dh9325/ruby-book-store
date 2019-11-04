class CategoriesController < ApplicationController
  def index
    @page_title = 'Available Categories'
    @categories = Category.all
  end

  def show
    @page_title = 'View Category'
    @category = Category.find(params[:id])
  end

  def new
    @page_title = 'Add New Category'
    @category = Category.new
  end

  def edit
    @page_title = 'Edit Category'
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path
  end

  private

    def category_params
      params.require(:category).permit(:name)
    end
end
