require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "test_user_find_by_opera" do
    opera = operas(:one)
    u = User.find_by_opera(opera.id)
    assert_equal 1, u.id
  end

end
