defmodule ServerWeb.TetrisLive.Playing do
  use ServerWeb, :live_view
  # alias Server.Game
  # alias ServerWeb.Data
  alias ServerWeb.PID
  # @rotate_keys ["ArrowUp"]
  # @bottom_keys [" ","ArrowDown"]
  # def mount(_params, _session, socket) do
  #   :timer.send_interval(500, self(), :tick)
  #   IO.inspect("이거 언제 실행되나?")
  #   {:ok, socket |> assign(game: Game.new())}
  # end
  def mount(_params, _session, socket) do
    # case socket.click =="PLAY" do
    # :timer.send_interval(500, self(), :tick)
    #   false -> IO.inspect("폴스")
    # end

    {:ok, socket |> assign(o1: %{state: 0, click: "PLAY"})}
  end
  def handle_event("click", %{"click"=> click}, socket) do

    {:noreply,socket|> update(:o1, fn o -> PID.pid_tetris(o,click) end ) }
  end
  def handle_info(:tick, socket) do
    { :noreply, socket |> update(:o1, &(updater(&1)) ) }
  end
  def updater(o) do
    o
    |> Map.put(:state, o.state+ 1 )
  end

  def maybe_end_game(%{assigns: %{game: %{game_over: true}}}=socket) do
    socket
    |> push_redirect(to: "/tetris/over?score=#{socket.assigns.game.score}")
  end
  def maybe_end_game(socket), do: socket

  # defp render_board(assigns) do
  #   ~L"""
  #   <svg width="200" height="400">
  #     <rect width="400" height="400" style="fill:rgb(50,50,50);" />
  #     <%= render_points(assigns) %>
  #   </svg>
  #   """
  # end
  # defp render_points(assigns) do
  #   ~L"""
  #   <%= for {x, y, shape} <- @game.points ++ Game.junkyard_points(@game) do %>
  #     <image
  #     href="https://storage.googleapis.com/iex/api/logos/<%= random_stock_img() %>.png"
  #       width="20" height="20"
  #       x="<%= (x - 1) * 20 %>" y="<%= (y - 1) * 20 %>"
  #       style="fill:<%= color(shape) %>;" />
  #   <% end %>
  #   """
  # end


  # defp random_stock_img() do
  #   Data.tickerlist()
  #   |> Enum.random()
  #   |> String.upcase()
  # end


  # defp color(:l), do: "red"
  # defp color(:j), do: "royalblue"
  # defp color(:s), do: "limegreen"
  # defp color(:z), do: "yellow"
  # defp color(:o), do: "magenta"
  # defp color(:i), do: "silver"
  # defp color(:t), do: "saddlebrown"
  # defp color(_),  do: "red"


  # def rotate(%{assigns: %{game: game}}=socket) do
  #   assign(socket, game: Game.rotate(game))
  # end

  # def left(%{assigns: %{game: game}}=socket) do
  #   assign(socket, game: Game.left(game))
  # end
  # def bottom(%{assigns: %{game: game}}=socket) do
  #   assign(socket, game: Game.bottom(game))
  # end

  # def right(%{assigns: %{game: game}}=socket) do
  #   assign(socket, game: Game.right(game))
  # end

  # def down(%{assigns: %{game: game}}=socket) do
  #   assign(socket, game: Game.down(game))
  # end




  # def handle_event("keystroke", %{"key" => key}, socket) when key in @rotate_keys do
  #   {:noreply, socket |> rotate}
  # end
  # def handle_event("keystroke", %{"key" => key}, socket) when key in @bottom_keys do
  #   {:noreply, socket |> bottom}
  # end

  # def handle_event("keystroke", %{"key" => "ArrowRight"}, socket) do
  #   {:noreply, socket |> right}
  # end

  # def handle_event("keystroke", %{"key" => "ArrowLeft"}, socket) do
  #   {:noreply, socket |> left}
  # end

  # def handle_event("keystroke", _, socket) do
  #   {:noreply, socket}
  # end

end
