require 'httparty'

class ScryfallApi
  API_URL = "https://api.scryfall.com/cards/search?order=name&q="

  def find_card(name)
    response = HTTParty.get(API_URL + name).to_json
    JSON.parse(response)
  end
end