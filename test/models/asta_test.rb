require 'test_helper'

class AstaTest < ActiveSupport::TestCase
  test "test_miglior_offerta" do
    asta = asta(:in_corso)
    offerta = Asta.miglior_offerta(asta.id)
    migliore = offerta(:miglior)
    assert_equal offerta, migliore
  end
  test "find_by_artista" do
    artista = artista(:one)
    asta = Asta.find_by_artista(artista.id)
    assert_equal asta.first, asta(:in_corso)
  end
end
