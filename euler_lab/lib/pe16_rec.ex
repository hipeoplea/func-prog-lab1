defmodule PE16Rec do
  @moduledoc """
  Solves Project Euler Problem 16 using naive recursion.
  """

  defp pow2(exp) do
    Integer.pow(2, exp)
  end

  defp sum_digits(0), do: 0

  defp sum_digits(n) do
    rem(n, 10) + sum_digits(div(n, 10))
  end

  def solve(exp \\ 1000) do
    exp
    |> pow2()
    |> sum_digits()
  end
end
