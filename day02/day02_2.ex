defmodule Day02_2 do

  def run do
    File.stream!("input.txt")
    |> Enum.map(&parse_row/1)
    |> Enum.sum
  end

  def parse_row(row) do
    row
    |> String.split
    |> Enum.map(&String.to_integer/1)
    |> row_even_division
  end

  def row_even_division([a | rest]) do
    row_even_division(rest, a)
  end

  def row_even_division([], _), do: 0

  def row_even_division([b | rest], a) do
    result = cond do
      rem(a, b) == 0 ->
        div(a, b)
      rem(b, a) == 0 ->
        div(b, a)
      true ->
        row_even_division(rest, a)
    end
    if result == 0 do
      row_even_division(rest, b)
    else
      result
    end
  end

end
