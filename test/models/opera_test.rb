require 'test_helper'

class OperaTest < ActiveSupport::TestCase
  test "test_find_by_artista" do
    a = artista(:one)
    opera = Opera.find_by_artista(a.id).first
    assert_equal 1, opera.id
  end
end
