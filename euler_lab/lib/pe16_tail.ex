defmodule PE16Tail do
  @moduledoc """
  Solves Project Euler Problem 16 using tail-recursive approach.
  """

  defp pow2(exp) do
    Integer.pow(2, exp)
  end

  defp sum_digits(n) do
    sum_digits(n, 0)
  end

  defp sum_digits(0, acc), do: acc

  defp sum_digits(n, acc) do
    digit = rem(n, 10)
    sum_digits(div(n, 10), acc + digit)
  end

  def solve(exp \\ 1000) do
    exp
    |> pow2()
    |> sum_digits()
  end
end
