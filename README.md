# KamaroNumber

**An Elixir package that convert numbers to Words**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `kamaro_number` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:kamaro_number, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/kamaro_number>.

## Usage Examples

````
      KamaroNumber.convert(100)
      # "one hundred"

      KamaroNumber.convert(100.5)
      # "one hundred point five"

      KamaroNumber.convert(4.9)
      "# four point nine"

      KamaroNumber.convert(21.7)
      "tw# enty-one point seven"

      KamaroNumber.convert(1000)
      # "one thousand"

      KamaroNumber.convert(10000)
      # "ten thousand"

      KamaroNumber.convert(100_000)
      # "one hundred thousand"

      KamaroNumber.convert(1_000_000)
      # "one million"

      KamaroNumber.convert(1_000_023)
      # "one million and twenty-three"

      KamaroNumber.convert(1_000_000_000_000_000_000)
      # "one quintillion"

```ex
````
