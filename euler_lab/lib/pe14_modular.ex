defmodule PE14Mod do

  @moduledoc """
  Solves Project Euler Problem 14 using modular, composable functions.
  """

  defp generate_start_numbers(limit) do
    1..(limit - 1)
  end

  defp filter_candidates(enum) do
    enum
    |> Enum.filter(fn n ->
      n == 1 or rem(n, 2) == 1
    end)
  end

  def collatz_len(n), do: collatz_len(n, 1)
  defp collatz_len(1, acc), do: acc

  defp collatz_len(n, acc) when rem(n, 2) == 0,
    do: collatz_len(div(n, 2), acc + 1)

  defp collatz_len(n, acc),
    do: collatz_len(3 * n + 1, acc + 1)

  def attach_lengths(enum) do
    enum
    |> Enum.map(fn n -> {n, collatz_len(n)} end)
  end

  defp reduce_to_max_pair(enum_of_pairs) do
    Enum.reduce(enum_of_pairs, {1, 1}, fn {n, len}, {best_n, best_len} ->
      if len > best_len do
        {n, len}
      else
        {best_n, best_len}
      end
    end)
  end

  def solve(limit \\ 1_000_000) do
    limit
    |> generate_start_numbers()
    |> filter_candidates()
    |> attach_lengths()
    |> reduce_to_max_pair()
  end
end
