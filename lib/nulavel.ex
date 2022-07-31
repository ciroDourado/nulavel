defmodule Nulavel do


  @doc """
  Tenta containerizar um valor

  Caso seja nula, é retornado um erro
  Caso seja válido, é containerizado
  """
  def ok?(valor) do
    case valor do
      nil -> erro("Tentativa de containerizar nulo")
      _   -> ok(valor)
    end
  end


  @doc """
  Retorna um container para um valor válido

  Juntamente com uma mensagem padrão
  """
  def ok(valor) do
    %{
      valor: valor,
      mensagem: "ok"
    }
  end


  @doc """
  Retorna um container para um valor nulo

  Juntamente com uma mensagem descrevendo o erro
  """
  def erro(mensagem) do
    %{
      valor: nil,
      mensagem: mensagem
    }
  end


  @doc """
  Aplica a função/ação na variável caso não seja nula

  Essa função retorna um novo container, onde:
  1. temos a variável modificada

  Caso seja nula nada acontece, e o erro original é repassado
  """
  def entao(container, acao) do
    # case container.valor do
    #   nil -> container
    #   _   -> acao.(container.valor) |> ok
    # end
  end


  @doc """
  Aplica a função/ação na variável caso não seja nula

  Essa função retorna um novo container, onde:
  1. pode ser a variável modificada
  2. ou um novo erro

  Caso seja nula nada acontece, e o erro original é repassado
  """
  def e_entao(container, acao) do
    # case container.valor do
    #   nil -> container
    #   _   -> acao.(container.valor)
    # end
  end


  @doc """
  Troca o container por outro, apenas se o original for um erro

  Caso não seja nula nada acontece, e o container original é repassado
  """
  def ou_entao(container, novo) do
    # case container.valor do
    #   nil -> container
    #   _   -> acao.(container.valor)
    # end
  end


  @doc """
  Verifica se um container é inválido
  """
  def e_erro(container) do
    container.valor == nil
  end


  @doc """
  Verifica se um container é válido
  """
  def e_ok(container) do
    container.valor != nil
  end
end
