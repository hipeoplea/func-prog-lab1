defmodule PE16Test do
  use ExUnit.Case, async: true


  @exp_cases [
    {0, 1},
    {1, 2},
    {2, 4},
    {5, 5},
    {10, 7},
    {15, 26},
    {20, 31},
    {50, 76},
    {1000, 1366}
  ]



  @solve_impls [
    PE16Tail,
    PE16Rec,
    PE16Modular,
    PE16Stream
  ]


  test "all attempts to solve /1 accurately calculate the sum of 2^exp" do
    Enum.each(@exp_cases, fn {exp, expected_sum} ->
      Enum.each(@solve_impls, fn mod ->
        result = mod.solve(exp)

        assert result == expected_sum,
               "module #{inspect(mod)}: solve(#{exp}) return #{result}, expected #{expected_sum}"
      end)
    end)
  end

end
