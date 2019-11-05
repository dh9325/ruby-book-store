class PublishersController < ApplicationController
  def index
    @page_title = 'Available Publishers'
    @publishers = Publisher.all
  end

  def show
    @page_title = 'View Publisher'
    @publisher = Publisher.find(params[:id])
  end

  def new
    @page_title = 'New Publisher'
    @publisher = Publisher.new
  end

  def edit
    @page_title = 'Edit Publisher'
    @publisher = Publisher.find(params[:id])
  end

  def create
    @publisher = Publisher.new(publisher_params)
    if @publisher.save
      redirect_to publishers_path
    else
      render 'new'
    end
  end

  def update
    @publisher = Publisher.find(params[:id])
    if @publisher.update(publisher_params)
      redirect_to @publisher
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

    def publisher_params
      params.require(:publisher).permit(:name)
    end
end
