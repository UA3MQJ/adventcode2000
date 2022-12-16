defmodule F do
  def b_ball("X"), do: 1
  def b_ball("Y"), do: 2
  def b_ball("Z"), do: 3
  def b_ball("A"), do: 1
  def b_ball("B"), do: 2
  def b_ball("C"), do: 3

  def tr("X"), do: "A"
  def tr("Y"), do: "B"
  def tr("Z"), do: "C"

  # A - камень С - ножницы B - бумага.
  # he, im
  # ничья
  def win("A", "A"), do: 3
  def win("B", "B"), do: 3
  def win("C", "C"), do: 3
  # я выйграл.
  def win("C", "A"), do: 6
  def win("A", "B"), do: 6
  def win("B", "C"), do: 6
  # я проиграл
  def win("B", "A"), do: 0
  def win("C", "B"), do: 0
  def win("A", "C"), do: 0

  # должен
  # X проиграть
  # Y в ничью
  # Z выиграть

  # проигрываем
  def move("A", "X"), do: "C"
  def move("B", "X"), do: "A"
  def move("C", "X"), do: "B"
  # ничья - ходим так же
  def move(x, "Y"), do: x
  # выигрываем
  def move("A", "Z"), do: "B"
  def move("B", "Z"), do: "C"
  def move("C", "Z"), do: "A"


end

{:ok, content} = File.read("./data.txt")

# part1
content
|> String.split("\n", trim: true)
|> Enum.map(fn(val) ->
  val
  |> String.split(" ", trim: true)
end)
|> Enum.reduce(0, fn([a, b], acc) ->
  {a, b, F.tr(b), F.b_ball(b), F.win(a, F.tr(b)),  F.b_ball(b) + F.win(a, F.tr(b))} |> IO.inspect()
  acc + F.b_ball(b) + F.win(a, F.tr(b))
end)
|> IO.inspect()

# part2
content
|> String.split("\n", trim: true)
|> Enum.map(fn(val) ->
  val
  |> String.split(" ", trim: true)
end)
|> Enum.reduce(0, fn([a, b], acc) ->
  {a, b, F.move(a, b), F.b_ball(F.move(a, b)), F.win(a, F.move(a, b))} |> IO.inspect()
  acc + F.b_ball(F.move(a, b)) + F.win(a, F.move(a, b))
end)
|> IO.inspect()
