require 'test_helper'

class CollectionTest < ActiveSupport::TestCase
  def setup
    @user = users(:kyle)
    @collection = @user.collections.build(name: "Lorem ipsum", user_id: @user.id)
  end

  test "should be valid" do
    assert @collection.valid?
  end

  test "user id should be present" do
    @collection.user_id = nil
    assert_not @collection.valid?
  end

  test "name should be present" do
    @collection.name = "   "
    assert_not @collection.valid?
  end

  test "order should be most recent first" do
    assert_equal collections(:collection_two), Collection.first
  end
end
