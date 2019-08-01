defmodule UseMacro do
    require CursoMacro
    CursoMacro.new_function :foo, do: "foo"
    CursoMacro.new_function :bar , do: "bar"
    CursoMacro.new_module :Artificial, do: "ayuda"
end