class PagesController < ApplicationController
  before_action :set_page, only: [:show, :destroy]

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

  def destroy
    if @page.destroy
      redirect_to root_path, notice: "ページを削除しました。"
    else
      redirect_to @page, alert: "ページを削除出来ませんでした。"
    end
  end

  private
    def set_page
      @page = Page.where(token: params[:token]).first
      redirect_to root_path, alert: 'ページは見つかりませんでした。URLを確認してください' unless @page
    end

    def page_params
      params.require(:page).permit(:title)
    end
end
