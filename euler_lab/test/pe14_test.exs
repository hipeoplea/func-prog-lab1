defmodule PE14Test do
  use ExUnit.Case, async: true

  @solve_cases [
    {50, 27},
    {100, 97},
    {200, 171},
    {1000, 871},
    {10_000, 6171},
    {1_000_000, 837_799}
  ]

  @tuple_impls [
    PE14Tail,
    PE14Stream,
    PE14Mod
  ]

  @n_only_impls [
    PE14Rec
  ]

  describe "{n, len} implementations" do
    for {limit, expected_n} <- @solve_cases,
        mod <- @tuple_impls do
      test "#{inspect(mod)}.solve(#{limit}) returns {#{expected_n}, len}" do
        mod = unquote(mod)
        {limit, expected_n} = unquote({limit, expected_n})

        {n, _len} = mod.solve(limit)

        assert n == expected_n,
               "module #{inspect(mod)} returned #{inspect(n)}, expected #{expected_n} for limit #{limit}"
      end
    end
  end


  describe "n-only implementations" do
    for {limit, expected_n} <- @solve_cases,
        mod <- @n_only_impls do
      test "#{inspect(mod)}.solve(#{limit}) returns #{expected_n}" do
        mod = unquote(mod)
        {limit, expected_n} = unquote({limit, expected_n})

        n = mod.solve(limit)

        assert n == expected_n,
               "module #{inspect(mod)} returned #{inspect(n)}, expected #{expected_n} for limit #{limit}"
      end
    end
  end
end
