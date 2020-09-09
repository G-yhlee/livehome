defmodule ServerWeb.V.Tables do
# alias ServerWeb.Helper.T
  def ticker_list(o) do
    o
    |> Map.keys
    |> Enum.map( fn key -> ticker_KEY?(key) end  )
    |> List.flatten
  end
  defp ticker_KEY?(key) do
    case key |> Atom.to_string |> String.slice(0..8)  == "V_ticker_" do
      true -> key
      false -> []
    end
  end
  def open_price(o,key) do
    state = case o.state > 10 do
      true ->  10
      false ->  o.state
    end
    price_list = for  s  <- 0..state do
      o[:"#{key}"] |> Enum.at(s) |> Map.get("average")
    end

    len = price_list |> Enum.filter(&(&1|>is_float)) |> length
    (price_list |> Enum.filter(&(&1|>is_float)) |> Enum.sum) / len |> Float.round(3)

  end
  def stable_price(o,key) do
    price = o[:"#{key}"] |> Enum.at(o.state) |> Map.get("average")
    case price == nil do
      true ->  recent_price(o,key)
      false ->o[:"#{key}"] |> Enum.at(o.state) |> Map.get("average")
    end
  end

  def style_(f,a) do
    f.(a)
  end
  def background_color(a) do
    case a > 0 do
       true -> background_color_inner(:red)
       false -> background_color_inner(:blue)
    end
  end
  def background_color_inner(a) do
    case a do
       :red -> "color: #de5454; text-align: center"
       :blue ->"color: #668cff; text-align: center"
    end
  end

  def recent_price(o,key) do

    state = case o.state > 15 do
      true ->  o.state
      false ->  15
    end

    price_list = for  s  <- (state-15)..state do
      o[:"#{key}"] |> Enum.at(s) |> Map.get("average")
    end

    len = price_list |> Enum.filter(&(&1|>is_float)) |> length
    (price_list |> Enum.filter(&(&1|>is_float)) |> Enum.sum) / len |> Float.round(3)

  end
  def gap(price1,price2) do

   (price2-price1) |> Float.round(3)

  end


end
