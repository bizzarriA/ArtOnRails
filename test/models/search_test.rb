require 'test_helper'

class SearchTest < ActiveSupport::TestCase
  test "search" do
    search = searches(:one)
    result = Search.search(search)[0]
    opera = operas(:one)
    # byebug
    assert result.include?(opera)

  end
end
