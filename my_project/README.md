# MyProject

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `my_project` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:my_project, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/my_project](https://hexdocs.pm/my_project).

## Comandos para el proyecto
Para nuevo proyecto
> mix new project

Para levantar el iex desde la raiz del proyecto y compilarlo
> iex -S mix

Para obtener las dependencias en mix.exs
> mix deps.get

Para recargar cambios en el modulo (estando en el iex)
> r Modulo 

Para ejecutar todas las pruebas del proyecto incluso se puede probar la documentacion doctest
> mix test

Si se agrega un nuevo modulo que no existe se debe compilar para que detecte los cambios  estando en iex
> c "lib/word_count.ex"