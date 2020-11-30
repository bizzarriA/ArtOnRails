require 'test_helper'

class SearchTest < ActiveSupport::TestCase
  test "search" do
    search = searches(:one)
    result = Search.search(search)
    opera = operas(:one)
    # byebug
    assert result.include?(opera)

  end
end
