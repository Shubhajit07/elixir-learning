defmodule Fibonacci do
  def seq(n), do: seq_acc(n, 0, 1)

  defp seq_acc(0, a, _), do: a

  defp seq_acc(n, a, b) do
    seq_acc(n - 1, b, a + b)
  end

  def run() do
    case IO.gets("Enter a number: ") |> String.trim() |> Integer.parse() do
      {n, ""} when n >= 0 -> seq(n) |> IO.inspect(label: "Fibonacci is")
      _ -> IO.puts("Invalid input. Please enter a non-negative integer.")
    end
  end
end

Fibonacci.run()
