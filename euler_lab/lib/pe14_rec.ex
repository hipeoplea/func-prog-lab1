defmodule PE14Rec do

  @moduledoc """
  Solves Project Euler Problem 14 using naive recursion.
  """

  def collatz_len(1), do: 1

  def collatz_len(n) when rem(n, 2) == 0 do
    1 + collatz_len(div(n, 2))
  end

  def collatz_len(n) do
    1 + collatz_len(3 * n + 1)
  end

  def solve(limit \\ 1_000_000) do
    1..(limit - 1)
    |> Enum.max_by(&collatz_len/1)
  end
end
