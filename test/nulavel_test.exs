defmodule NulavelTest do
  use ExUnit.Case
  doctest Nulavel

  test "Nulo não pode ser containerizado" do
    assert nil |> Nulavel.ok? |> Nulavel.e_erro
  end

  test "Não-nulo pode ser containerizado" do
    assert 1 |> Nulavel.ok? |> Nulavel.e_ok
  end

end
