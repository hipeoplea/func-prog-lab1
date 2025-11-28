defmodule PE14Tail do
  @moduledoc """
  Solves Project Euler Problem 14 using tail-recursive approach.
  """

  def collatz_len(n), do: collatz_len(n, 1)
  defp collatz_len(1, acc), do: acc

  defp collatz_len(n, acc) when rem(n, 2) == 0,
    do: collatz_len(div(n, 2), acc + 1)

  defp collatz_len(n, acc),
    do: collatz_len(3 * n + 1, acc + 1)

  def solve(limit \\ 1_000_000) do
    1..(limit - 1)
    |> Enum.reduce({1, 1}, fn n, {best, best_len} ->
      len = collatz_len(n)
      if len > best_len, do: {n, len}, else: {best, best_len}
    end)
  end
end
