require 'scryfall_api'

class Card < ApplicationRecord

  def Card.search(name)
    api = ScryfallApi.new()
    resp = api.find_card(name)
    resp["object"] == "error" ? resp["details"] : 
      Card.new(name: parseName(resp), imageUri: parseImageUrl(resp))
  end

  private
   
    def self.parseName(resp)
      resp["data"][0]["name"].downcase
    end

    def self.parseImageUrl(resp)
        resp["data"][0]["image_uris"]["normal"]
    end
end
