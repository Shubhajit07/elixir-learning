# Simple Recursive Functions in Elixir
defmodule ListHelper do
  def sum_list([]), do: 0
  def sum_list([head | tail]), do: head + sum_list(tail)
end

defmodule ListUtils do
  def length_([]), do: 0
  def length_([_ | tail]), do: 1 + length_(tail)
end

# Tail Recursive Functions in Elixir
# Tail recursion is a technique where the recursive call is the last operation in the function.
# This allows the Elixir runtime to optimize the recursion and avoid stack overflow errors for large lists
# by reusing the current function's stack frame.
defmodule TailRecursiveSum do
  def sum(list), do: sum_with_acc(list, 0)

  defp sum_with_acc([], accumulator), do: accumulator
  defp sum_with_acc([head | tail], accumulator), do: sum_with_acc(tail, accumulator+head)
end

defmodule ListReverse do
  def reverse(list), do: reverse_with_acc(list, [])
  defp reverse_with_acc([], acc), do: acc
  defp reverse_with_acc([head | tail], acc), do: reverse_with_acc(tail, [head | acc])
end

defmodule Main do
  def run do
    l1 = [1, 2, 3, 4, 5]
    l2 = []
    l3 = [10]
    l4 = [1, -1, 2]
    IO.puts("Sum of l1: #{TailRecursiveSum.sum(l1)}")
    IO.puts("Sum of l2: #{TailRecursiveSum.sum(l2)}")
    IO.puts("Sum of l3: #{TailRecursiveSum.sum(l3)}")
    IO.puts("Sum of l4: #{TailRecursiveSum.sum(l4)}")
    IO.puts("Length of l1: #{ListUtils.length_(l1)}")
    IO.puts("Length of l2: #{ListUtils.length_(l2)}")
    IO.puts("Length of l3: #{ListUtils.length_(l3)}")
    IO.puts("Length of l4: #{ListUtils.length_(l4)}")
    IO.puts("Reversed l1: #{inspect(ListReverse.reverse(l1))}")
    IO.puts("Reversed l2: #{inspect(ListReverse.reverse(l2))}")
    IO.puts("Reversed l3: #{inspect(ListReverse.reverse(l3))}")
    IO.puts("Reversed l4: #{inspect(ListReverse.reverse(l4))}")
  end
end

Main.run()
