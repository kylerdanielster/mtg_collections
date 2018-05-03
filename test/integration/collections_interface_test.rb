require 'test_helper'

class CollectionsInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:kyle)
  end

  test "collection interface" do
    log_in_as(@user)
    get root_path
    #assert_select 'div.pagination'
    # Invalid submission
    assert_no_difference 'Collection.count' do
      post collections_path, params: { collection: { name: "" } }
    end
    assert_select 'div#error_explanation'
    # Valid submission
    name = "This collection really ties the room together"
    assert_difference 'Collection.count', 1 do
      post collections_path, params: { collection: { name: name } }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match name, response.body
    # Delete post
    assert_select 'a', text: 'delete'
    first_collection = @user.collections.paginate(page: 1).first
    assert_difference 'Collection.count', -1 do
      delete collection_path(first_collection)
    end
    # Visit different user (no delete links)
    get user_path(users(:archer))
    assert_select 'a', text: 'delete', count: 0
  end
end
