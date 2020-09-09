defmodule ServerWeb.Mylib.O.K.Helper do
  def maybe_has_key?(o,keylist) do
    (o |> Map.keys |> length ) > (keylist |> length)
  end
end
