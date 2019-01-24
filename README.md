# ElixirCups

## Exemplo

```elixir
iex> ElixirCups.start_link
{:ok, #PID<0.131.0>}
iex> ElixirCups.list_printers
["Brother_Casa", "EPSON_L355_Baltar", "EPSON_L355_Caruaru"]
iex> ElixirCups.sel_printer("EPSON_L355_Caruaru")
:ok
iex> ElixirCups.print("/Users/teste.pdf")
:ok
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `elixir_cups` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:elixir_cups, git: "https://github.com/brunosantanaa/elixir-cups.git"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/elixir_cups](https://hexdocs.pm/elixir_cups).

