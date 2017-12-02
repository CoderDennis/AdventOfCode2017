defmodule Day01 do

  @doc ~s"""

  # Examples
 
    iex> Day01.captcha("1122")
    3

    iex> Day01.captcha("1111")
    4

    iex> Day01.captcha("1234")
    0

    iex> Day01.captcha("91212129")
    9

  """
  def captcha(input) do
    input
    |> String.trim()
    |> String.codepoints()
    |> Enum.map(&String.to_integer/1)
    |> sum_matching_digits(nil, 0)
  end

  defp sum_matching_digits([x], x, sum), do: sum + x
  
  defp sum_matching_digits([_], _, sum), do: sum

  defp sum_matching_digits([first | _] = list, nil, 0) do
    sum_matching_digits(list, first, 0)
  end

  defp sum_matching_digits([x, x | rest], first, sum) do
    sum_matching_digits([x | rest], first, x + sum)
  end

  defp sum_matching_digits([_ | rest], first, sum) do
    sum_matching_digits(rest, first, sum)
  end

end

# iex> File.read!("input.txt")
