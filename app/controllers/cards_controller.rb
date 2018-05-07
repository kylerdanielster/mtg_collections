class CardsController < ApplicationController
  def search
    if params[:name]
      @cards = Card.search(params[:name])
    else
      flash[:info] = "No cards found"
    end
  end
end
