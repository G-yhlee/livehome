defmodule ServerWeb.AlgorithmLive do
  use ServerWeb, :live_view
  def mount(_params, _session, socket) do
    socket = assign(
      socket,
      o1: %{+: 0, -: 0,state: 0}
      )
    {:ok, socket}
  end
  def ax do
    "color"
  end
  def ax2 do
    "red"
  end
  def styl do

    ~s"style=#{ax()}: #{ax2()};background-color: black;text-align: center"

  end


end
