defmodule Shop do
  def apply_taxes(taxes, orders) do
    Enum.map(orders, &get_total_amount(&1, taxes))
  end

  def get_total_amount(order, taxes) do
    Map.put(
      order,
      :total_amount,
      Map.get(taxes, order.ship_to, 0) * order[:net_amount] + order[:net_amount]
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

IO.inspect Shop.apply_taxes(orders, tax_rates)