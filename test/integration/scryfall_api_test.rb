require 'test_helper'
require 'scryfall_api'

class ScryfallApiTest < ActionDispatch::IntegrationTest
  
  test "can call scryfall api" do
    api = ScryfallApi.new()
    resp = api.find_card("brainstorm")
    assert resp != nil
    assert_equal resp["data"][0]["name"].downcase, "brainstorm"
    #puts resp["data"][0]["image_uris"]["normal"]
  end
end