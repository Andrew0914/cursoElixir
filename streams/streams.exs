stream = [1,2,3] 
|>
Stream.map(fn(x) -> 2 * x end)
|>
Stream.map(fn(x) -> x * x end)
|>
Enum.to_list
|>
Enum.take(1)