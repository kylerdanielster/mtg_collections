class CardSearchController < ApplicationController
  before_action :get_current_collection, only: :index
  respond_to :js, only: :index
  skip_before_action :verify_authenticity_token

  def index
      if params[:name]
        search_results = Card.search(params[:name])
        @card = Card.find_or_create_by(name: search_results[:name],
                                      imageUri: search_results[:imageUri])
      else
        flash[:info] = 'No cards found'
      end
  end

  private
    def get_current_collection
      @collection = Collection.find_by(id: params[:collection_id])
    end
end



# local
# card_search?utf8=%E2%9C%93&name=Terminate&collection_id=55&commit=Search

# prd
# card_search?utf8=%E2%9C%93&name=Brainstorm&collection_id=1&commit=Search