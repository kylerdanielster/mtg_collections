class CardSearchController < ApplicationController
  respond_to :html, :js

  def index
    if params[:name]
      @card = Card.search(params[:name])
    else
      flash[:info] = 'No cards found'
    end
  end
end