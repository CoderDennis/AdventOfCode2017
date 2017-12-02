defmodule Day01_2 do

  def run do
    File.read!("input.txt")
    |> captcha
  end

  @doc ~s"""
  iex> Day01_2.captcha("1212")
  6

  iex> Day01_2.captcha("1221")
  0

  iex> Day01_2.captcha("123425")
  4

  iex> Day01_2.captcha("123123")
  12

  iex> Day01_2.captcha("12131415")
  4

  """
  def captcha(input) do
    list = input
           |> String.trim()
           |> String.codepoints()
           |> Enum.map(&String.to_integer/1)
    {a, b} = Enum.split(list, div(length(list), 2))
    Enum.zip(a, b)
    |> sum_matching_digits(0)
  end

  defp sum_matching_digits([], sum), do: sum

  defp sum_matching_digits([{x, x} | rest], sum) do
    sum_matching_digits(rest, sum + (2 * x))
  end

  defp sum_matching_digits([_ | rest], sum) do
    sum_matching_digits(rest, sum)
  end
end
