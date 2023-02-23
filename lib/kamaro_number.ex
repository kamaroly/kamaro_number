defmodule KamaroNumber do
  @moduledoc """
  An Elixir package to spell out numbers into Words such as one hundred twenty three point thirty seven.
  """
  @moduledoc since: "0.1.0"

  @hyphen "-"
  @conjunction " and "
  @separator ", "
  @negative " negative "
  @decimal " point "

  @dictionary %{
    0 => :zero,
    1 => :one,
    2 => :two,
    3 => :three,
    4 => :four,
    5 => :five,
    6 => :six,
    7 => :seven,
    8 => :eight,
    9 => :nine,
    10 => :ten,
    11 => :eleven,
    12 => :twelve,
    13 => :thirteen,
    14 => :fourteen,
    15 => :fifteen,
    16 => :sixteen,
    17 => :seventeen,
    18 => :eighteen,
    19 => :nineteen,
    20 => :twenty,
    30 => :thirty,
    40 => :fourty,
    50 => :fifty,
    60 => :sixty,
    70 => :seventy,
    80 => :eighty,
    90 => :ninety,
    100 => :hundred,
    1000 => :thousand,
    1_000_000 => :million,
    1_000_000_000 => :billion,
    1_000_000_000_000 => :trillion,
    1_000_000_000_000_000 => :quadrillion,
    1_000_000_000_000_000_000 => :quintillion
  }

  @doc """
  Convert negative number words given `number`.

  Returns `String`.

  ## Examples

      iex> KamaroNumber.spell_out(-29.7)
      "negative twenty-nine point seven"

  """
  def spell_out(number) when number < 0, do: @negative <> spell_out(abs(number))

  def spell_out(number) when number < 21 do
    Atom.to_string(@dictionary[number])
  end

  def spell_out(number) when number < 100 do
    tens = div(number, 10) * 10
    remainder = rem(number, 10)

    words = @dictionary[tens] |> Atom.to_string()

    case remainder do
      0 -> words
      _ -> words <> @hyphen <> spell_out(remainder)
    end
  end

  def spell_out(number) when number < 1000 do
    hundreds = div(number, 100)
    remainder = rem(number, 100)

    words = @dictionary[hundreds] |> Atom.to_string()
    words = words <> " " <> (@dictionary[100] |> Atom.to_string())

    case remainder do
      0 -> words
      _ -> words <> " " <> spell_out(remainder)
    end
  end

  def spell_out(number) do
    based_number =
      number
      |> log(1000)
      |> trunc()

    base_unit = :math.pow(1000, based_number) |> trunc

    number_base_units = div(number, base_unit)
    remainder = rem(number, base_unit)

    # based_number
    words =
      spell_out(number_base_units) <>
        " " <> Atom.to_string(@dictionary[base_unit])

    case remainder do
      0 ->
        words

      _ ->
        words_with_separator = words <> if remainder < 100, do: @conjunction, else: @separator
        words_with_separator <> spell_out(remainder)
    end
  end

  @doc """
  Calculates logarithm of any number in any base.
  Covers for the missing logarithm function in Erlang/ Elixir

  Returns `float`.

  ## Examples

      iex> KamaroNumber.spell_out(34)
      "thirty four"

  """
  def log(number, base) do
    :math.log(number) / :math.log(base)
  end

  @doc """
  Converts number to words

  Returns `string`.

  ## Examples

      iex> KamaroNumber.convert(34.3)
      "thirty four point three"

  """
  def convert(number) when is_float(number) do
    # Begin by separating int and fractions
    [number, fraction] =
      number
      |> Float.to_string()
      |> String.split(".")
      |> Enum.map(&Integer.parse(&1))
      |> Enum.map(fn {num, ""} ->
        num
      end)

    # Consider fractions
    fractions =
      fraction
      |> Integer.to_string()
      |> String.graphemes()
      |> Enum.map(fn num ->
        {num, _} = Integer.parse(num)
        num
      end)
      |> Enum.map(fn num ->
        spell_out(num)
      end)

    # Display the final results
    spell_out(number) <> @decimal <> Enum.join(fractions, " ")
  end

  def convert(number) when is_integer(number) do
    spell_out(number)
  end
end
