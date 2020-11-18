require 'test_helper'

class FavoriteTest < ActiveSupport::TestCase
  test "test_opere" do
    user = users(:one)
    opera = Favorite.opere(user.id).first
    assert_equal 1, opera.id
  end
end
