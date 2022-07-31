defmodule NulavelTest do
  use ExUnit.Case
  doctest Nulavel

  test "Nulo não pode ser containerizado" do
    # assert nil |> Nulavel.ok? |> Nulavel.e_erro
    assert(false, "Não implementado")
  end

  test "Não-nulo pode ser containerizado" do
    # assert 1 |> Nulavel.ok? |> Nulavel.e_ok
    assert(false, "Não implementado")
  end

end
