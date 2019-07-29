defmodule MapsLists do
    
    def apply_taxes(orders,tax_rates) do
        # Itera los mapas dentro de la lista y cada item puede agregar en si mismo al mapa
        Enum.map(orders , 
            fn order -> 
                cond do 
                    order.ship_to == :NC -> Map.put(order , :total_amout , (order.net_amount * (1  + tax_rates[:NC]) ))
                    order.ship_to == :TX -> Map.put(order , :total_amout , (order.net_amount * ( 1 + tax_rates[:TX]) ))
                    true ->  Map.put(order , :total_amout , order.net_amount)
                end
            end
        )

    end

end

tax_rates = %{NC: 0.075, TX: 0.08}

orders = [
        %{id: 123, ship_to: :NC, net_amount: 100.00 },
        %{id: 124, ship_to: :OK, net_amount:  35.50 },
        %{id: 125, ship_to: :TX, net_amount:  24.00 },
        %{id: 126, ship_to: :TX, net_amount:  44.80 },
        %{id: 127, ship_to: :NC, net_amount:  25.00 },
        %{id: 128, ship_to: :MA, net_amount:  10.00 },
        %{id: 129, ship_to: :CA, net_amount: 102.00 },
        %{id: 130, ship_to: :NC, net_amount:  50.00 } ]

IO.inspect MapsLists.apply_taxes(orders, tax_rates)