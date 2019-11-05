class AuthorsController < ApplicationController
  def index
    @page_title = 'Available Authors'
    @authors = Author.all
  end

  def show
    @page_title = 'View Author'
    @author = Author.find(params[:id])
  end

  def new
    @page_title = 'New Author'
    @author = Author.new
  end

  def edit
    @page_title = 'Edit Author'
    @author = Author.find(params[:id])
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to authors_path
    else
      render 'new'
    end
  end

  def update
    @author = Author.find(params[:id])
    if @author.update(author_params)
      redirect_to @author
    else
      render 'edit'
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
  end


  private

    def author_params
      params.require(:author).permit(:first_name, :last_name)
    end
end
