defmodule ServerWeb.PhotoLive do
  use Phoenix.LiveView
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:current_id, Photo.first_id())
      |> assign(:slideshow, :stopped)
    {:ok, socket}
  end

  def handle_info(:PLAY_ing, socket) do
    {:noreply, next_id(socket)}
  end
  def handle_event("PLAY", _, socket) do
    {:ok, ref} = :timer.send_interval(1_000, self(), :PLAY_ing)
    IO.inspect(ref)
    {:noreply, assign(socket, :slideshow, ref)}
  end
  def handle_event("STOP", _, socket) do
    :timer.cancel(socket.assigns.slideshow)
    {:noreply, assign(socket, :slideshow, :stopped)}
  end
  def handle_event("prev", _, socket) do
    {:noreply, prev_id(socket)}
  end
  def handle_event("next", _, socket) do
    {:noreply, next_id(socket)}
  end



  def prev_id(socket) do
    assign(socket, :current_id,
      Photo.prev_image_id(socket.assigns.current_id))
  end

  def next_id(socket) do
    assign(socket, :current_id,
      Photo.next_image_id(socket.assigns.current_id))
  end

  def thumb_css_class(thumb_id, current_id) do
    if thumb_id == current_id do
      "thumb-selected"
    else
      "thumb-unselected"
    end
  end
end
