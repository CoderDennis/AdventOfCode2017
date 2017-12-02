defmodule Day02 do

  def run do
    File.stream!("input.txt")
    |> Enum.map(&parse_row/1)
    |> Enum.sum
  end

  def parse_row(row) do
    row
    |> String.split
    |> Enum.map(&String.to_integer/1)
    |> row_difference
  end

  def row_difference(row_items) do
    {min, max} = Enum.min_max(row_items)
    max - min
  end

end
