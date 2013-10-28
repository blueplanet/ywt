class YwtItemsController < ApplicationController
  before_action :set_page, only: [:create, :destroy]

  def create
    @ywt_item = @page.ywts.build ywt_item_params
    @ywt_item.save

    redirect_to page_path(@page.token)
  end

  def destroy
    @ywt_item = YwtItem.find params[:id]
    @ywt_item.destroy

    redirect_to page_path(@page.token)
  end

  private
    def set_page
      @page = Page.where(token: params[:page_token]).first
    end

    def ywt_item_params
      params.require(:ywt_item).permit(:body, :item_type)
    end
end
