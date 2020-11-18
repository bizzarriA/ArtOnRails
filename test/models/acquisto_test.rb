require 'test_helper'

class AcquistoTest < ActiveSupport::TestCase
  test "find_opere_by_user" do
    user = users(:one)
    opera = Acquisto.opere(user.id).first
    # byebug
    assert_equal opera, operas(:one)
  end
end
