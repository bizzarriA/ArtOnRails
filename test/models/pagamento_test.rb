require 'test_helper'

class PagamentoTest < ActiveSupport::TestCase

  test "test_find_pay_methods" do
    u = users(:one)
    pagamento = Pagamento.find_pay_methods(u.id).first
    # byebug
    assert_equal 1, pagamento.id
  end
end
