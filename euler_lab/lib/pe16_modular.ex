defmodule PE16Modular do
  @moduledoc """
  Solves Project Euler Problem 16 using modular, composable functions.
  """

  defp pow2(exp) do
    Integer.pow(2, exp)
  end

  defp generate_digits(n) do
    n
    |> Integer.to_string()
    |> String.graphemes()
  end

  defp sum_digit_list(digits) do
    digits
    |> Enum.map(&String.to_integer/1)
    |> Enum.reduce(0, fn d, acc -> acc + d end)
  end

  def solve(exp \\ 1000) do
    exp
    |> pow2()
    |> generate_digits()
    |> sum_digit_list()
  end
end
