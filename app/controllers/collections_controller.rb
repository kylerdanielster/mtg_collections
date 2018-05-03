class CollectionsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @collection = current_user.collections.build(collection_params)
    if @collection.save
      flash[:success] = "collection created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @collection.destroy
    flash[:success] = "Collection deleted"
    redirect_to request.referrer || root_url
  end

  private

    def collection_params
      params.require(:collection).permit(:content)
    end

    def correct_user
      @collection = current_user.collections.find_by(id: params[:id])
      redirect_to root_url if @collection.nil?
    end
end
