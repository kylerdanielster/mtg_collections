require 'test_helper'

class CardTest < ActiveSupport::TestCase
  def setup
    @card = Card.new(name: "Brainstorm", imageUri: "example.com")
  end

  test "should be valid" do
    assert @card.valid?
  end

  test "should find card" do
    assert_equal Card.search("brainstorm").name, "brainstorm"
  end

  test "should return error" do
    assert_equal Card.search(""), "You didn‘t enter anything to search for."
  end
end
