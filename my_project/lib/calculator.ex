defmodule Calculator do

    def start do
        spawn(fn -> 
            initial_value = 0
            loop(initial_value)
        end)
    end
    
    defp loop(value) do
        new_value = receive do
            {:add,operand} ->
                value + operand
            {:sub,operand} ->
                value - operand
            {:mul,operand} ->
                value * operand
            {:div,operand} ->
                value / operand
            {:value, caller} ->
                send(caller,value)
        end
        loop(new_value)
    end
    
    def add(calculator_pid , operando) do
        send(calculator_pid,{:add , operando})
    end

    def sub(calculator_pid , operando) do
        send(calculator_pid,{:sub , operando})
    end

    def mul(calculator_pid , operando) do
        send(calculator_pid,{:mul , operando})
    end

    def div(calculator_pid , operando) do
        send(calculator_pid,{:div , operando})
    end

    def value(calculator_pid) do
        send(calculator_pid,{:value, self()})
        receive do
            value ->
                value
        end
    end
    
end