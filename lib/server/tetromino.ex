defmodule Server.Tetromino do
  defstruct shape: :l, rotation: 0, location: {3, -4}
  alias Server.{Point, Points}
  # def new_random do
  #   # __struct__(shape: ~w[i #{"t"} #{"o"} #{"l"} l2 j z s x1 x2 x3]a  |> Enum.random )
  #   __struct__(shape: ~w[ #{"t"} #{"o"} #{"l"} ]a  |> Enum.random )
  # end
  def new_random_ticker(ticker) do
    __struct__(shape: ~w[ #{ticker}  ]a  |> Enum.random )
  end
  # 여기서 {모양: 모양값, 티커: 티커값 } 이렇게 만들자
  # def new_random do
  #   __struct__(shape: ~w[i t o l l2 j z s]a  |> Enum.random )
  # end
  def right(tetro) do
    %{tetro|location: Point.right(tetro.location)}
  end

  def left(tetro) do
    %{tetro|location: Point.left(tetro.location)}
  end

  def down(tetro) do
    %{tetro| location: Point.down(tetro.location)}
  end

  def rotate(tetro) do
    %{tetro| rotation: rotate_degrees(tetro.rotation)}
  end
  def bottom(tetro) do
    %{tetro| location: Point.bottom(tetro.location)}
  end

  def show(tetro) do
    tetro
    |> points
    |> Points.rotate(tetro.rotation)
    |> Points.locate(tetro.location)
    |> Points.add_shape(tetro.shape)
  end

  def points(_tetro) do
    [
      [{2, 1}],
      # [{2, 1},{2, 2}],
      # [ {2, 1},{3, 1},
              #  {3, 2}]
    ] |> Enum.at( 0)
  end
  # def points(_tetro) do

  #   [
  #     {2, 1}
  #   ]
  # end
  # def points(%{shape: :x1}) do
  #   [
  #     {2, 1}
  #   ]
  # end
  # def points(%{shape: :x2}) do
  #   [
  #     {2, 1},{2, 2}
  #   ]
  # end
  # def points(%{shape: :x3}) do
  #   [
  #     {2, 1},{3, 1},
  #            {3, 2}
  #   ]
  # end
  # def points(%{shape: :l}) do
  #   [
  #     {2, 1},
  #     {2, 2},
  #     {2, 3}, {3, 3}
  #   ]
  # end
  # def points(%{shape: :aapl}) do
  #   [
  #     {1, 1},
  #     {1, 2},
  #     {1, 3}, {2, 3}
  #   ]
  # end
  # def points(%{shape: :j}) do
  #   [
  #             {3, 1},
  #             {3, 2},
  #     {2, 3}, {3, 3},
  #   ]
  # end
  # def points(%{shape: :s}) do
  #   [
  #             {2, 2}, {3, 2},
  #     {1, 3}, {2, 3}
  #   ]
  # end
  # def points(%{shape: :z}) do
  #   [
  #     {1, 2}, {2, 2},
  #             {2, 3}, {3, 3}
  #   ]
  # end
  # def points(%{shape: :i}) do
  #   [
  #     {2, 1},
  #     {2, 2},
  #     {2, 3},
  #     {2, 4}
  #   ]
  # end
  # def points(%{shape: :o}) do
  #   [
  #     {2, 2}, {3, 2},
  #     {2, 3}, {3, 3}
  #   ]
  # end
  # def points(%{shape: :t}) do
  #   [
  #     {1, 2}, {2, 2}, {3, 2},
  #             {2, 3}
  #   ]
  # end



  defp rotate_degrees(270) do
    0
  end
  defp rotate_degrees(n) do
    n + 90
  end

  def maybe_move(_old, new, true=_valid), do: new
  def maybe_move(old, _new, false=_valid), do: old
end
