defmodule CursoMacro do
    defmacro new_function(name , do: block) do
        quote do
            def unquote(name) () do 
                unquote(block)
            end
        end
    end

    defmacro new_module(name, do: block)do
        quote do
            defmodule unquote(name) do
                unquote(block)
            end
        end
    end
end 