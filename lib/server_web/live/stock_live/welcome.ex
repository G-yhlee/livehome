# defmodule ServerWeb.GameLive.Welcome do
#   use ServerWeb, :live_view
#   alias Server.Game
#   def mount(_params, _session, socket) do
#     {
#       :ok,
#       assign(socket, game: Map.get(socket.assigns, :game) || Game.new )
#     }
#   end
#   def handle_event("play", _, socket) do
#     {:noreply, push_redirect(socket, to: "/game/playing") }
#   end
# end
