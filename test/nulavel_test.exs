defmodule NulavelTest do
  use ExUnit.Case
  doctest Nulavel

  test "Nulo não pode ser containerizado" do
    assert nil |> Nulavel.ok? |> Nulavel.e_erro
  end

  test "Não-nulo pode ser containerizado" do
    assert 1 |> Nulavel.ok? |> Nulavel.e_ok
  end

  test "Operação apenas em não-nulos" do
    dobrar    = fn numero -> numero * 2 end
    triplicar = fn numero -> numero * 3 end
    resultado = Nulavel.ok(1)
    |> Nulavel.entao(dobrar)
    |> Nulavel.entao(triplicar)

    assert resultado.valor == 6
  end

  test "Sem operação em valores nulos" do
    dobrar    = fn numero -> numero * 2 end
    triplicar = fn numero -> numero * 3 end
    resultado = Nulavel.ok?(nil)
    |> Nulavel.entao(dobrar)
    |> Nulavel.entao(triplicar)

    assert resultado.valor == nil
  end

  test "Parar na primeira operação que retorna um erro" do
    recebe_um = fn numero ->
      case numero do
        1 -> ok(numero)
        _ -> erro("Não é 1")
      end
    end

    recebe_tres = fn numero ->
      case numero do
        3 -> ok(numero)
        _ -> erro("Não é 3")
      end
    end

    resultado = Nulavel.ok(2)
    |> Nulavel.e_entao(recebe_um)
    |> Nulavel.e_entao(recebe_tres)
    assert resultado.mensagem == "Não é 1"
  end

end
