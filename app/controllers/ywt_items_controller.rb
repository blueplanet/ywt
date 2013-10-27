class YwtItemsController < ApplicationController
  def create
    @page = Page.where(token: params[:page_token]).first
    @ywt_item = @page.ywts.build ywt_item_params
    @ywt_item.save

    redirect_to page_path(@page, token: @page.token)
  end

  private
    def ywt_item_params
      params.require(:ywt_item).permit(:body, :item_type)
    end
end
