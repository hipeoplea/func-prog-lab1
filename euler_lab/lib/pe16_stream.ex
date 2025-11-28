defmodule PE16Stream do
  @moduledoc """
  Solves Project Euler Problem 16 using lazy Stream evaluation.
  """

  defp pow2(exp) do
    Integer.pow(2, exp)
  end

  def solve(exp \\ 1000) do
    exp
    |> pow2()
    |> Integer.to_string()
    |> String.to_charlist()
    |> Stream.map(&(&1 - ?0))
    |> Enum.sum()
  end
end
