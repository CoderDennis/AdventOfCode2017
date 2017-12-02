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

  def row_even_division([a | _], b) when rem(a, b) == 0 do
    div(a, b)
  end

  def row_even_division([a | _], b) when rem(b, a) == 0 do
    div(b, a)
  end

  def row_even_division([a | rest], b) do
    result = row_even_division(rest, b)
    if result == 0 do
      row_even_division(rest, a)
    else
      result
    end
  end
  
end
