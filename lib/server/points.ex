defmodule Server.Points do
  alias Server.Point

  def locate(points, {change_x, change_y}) do
    points
    |> Enum.map(fn {x, y} ->  {x + change_x, y + change_y} end)
  end

  def add_shape(points, shape) do
    points
    |> Enum.map(fn point -> Point.add_shape(point, shape) end)
  end

  def rotate(points, degrees) do
    points
    |> Enum.map(fn point -> Point.rotate(point, degrees) end)
  end

  def valid?(points, junkyard) do
    Enum.all?(points, &Point.valid?(&1, junkyard))
  end
end
