defmodule PE14Stream do

  @moduledoc """
  Solves Project Euler Problem 14 using lazy Stream evaluation.
  """

  def collatz_len(n), do: collatz_len(n, 1)
  defp collatz_len(1, acc), do: acc

  defp collatz_len(n, acc) when rem(n, 2) == 0,
    do: collatz_len(div(n, 2), acc + 1)

  defp collatz_len(n, acc),
    do: collatz_len(3 * n + 1, acc + 1)

  def solve(limit \\ 1_000_000) do
    1
    |> Stream.iterate(&(&1 + 1))
    |> Stream.take_while(&(&1 < limit))
    |> Stream.map(fn n -> {n, collatz_len(n)} end)
    |> Enum.max_by(fn {_n, len} -> len end)
  end
end
