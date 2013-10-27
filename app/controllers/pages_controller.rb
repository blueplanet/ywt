class PagesController < ApplicationController
  def new
    @page = Page.new
  end
  
  def create
    @page = Page.new page_params
    if @page.save
      redirect_to page_path(@page, token: @page.token)
    else
      render :new
    end
  end

  def show
    @page = Page.where(token: params[:token]).first
  end

  private
    def page_params
      params.require(:page).permit(:title)
    end
end
