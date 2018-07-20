class CollectionCardsController < ApplicationController
  respond_to :html, :js

  def update
    @collection = Collection.find_by(id: params[:collection_id])
    @card = Card.find_by(id: params[:id])
    @collection.cards << @card
  end
end
