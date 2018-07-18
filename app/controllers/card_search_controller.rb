class CardSearchController < ApplicationController
  before_action :get_current_collection, only: :index
  respond_to :html, :js

  def index
    if params[:name]
      @card = Card.search(params[:name])
    else
      flash[:info] = 'No cards found'
    end
  end

  private
    def get_current_collection
      @collection = Collection.find_by(id: params[:collection_id])
    end
end