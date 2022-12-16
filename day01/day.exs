
{:ok, content} = File.read("./data.txt")

content
|> String.split("\n\n", trim: true)
|> Enum.map(fn(val) ->
  val
  |> String.split("\n", trim: true)
  |> Enum.map(&String.to_integer/1)
  |> Enum.sum()
end)
|> Enum.max()
|> IO.inspect()

[e1,e2,e3|_] = content
|> String.split("\n\n", trim: true)
|> Enum.map(fn(val) ->
  val
  |> String.split("\n", trim: true)
  |> Enum.map(&String.to_integer/1)
  |> Enum.sum()
end)
|> Enum.sort(:desc)
|> IO.inspect()

(e1+e2+e3) |> IO.inspect()
