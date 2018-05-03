require 'test_helper'

class CollectionControllerTest < ActionDispatch::IntegrationTest
  def setup
    @collection = collections(:collection_one)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Collection.count' do
      post collections_path, params: { collection: { name: "Lorem ipsum" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Collection.count' do
      delete collection_path(@collection)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong collection" do
    log_in_as(users(:kyle))
    collection = collections(:collection_three)
    assert_no_difference 'Collection.count' do
      delete collection_path(collection)
    end
    assert_redirected_to root_url
  end
end
