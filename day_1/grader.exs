defmodule Grader do
  @spec determine_grade(integer()) :: :A | :B | :C | :D | :F
  def determine_grade(grade) do
    cond do
      grade >= 90 -> :A
      grade >= 80 -> :B
      grade >= 70 -> :C
      grade >= 60 -> :D
      true -> :F
    end
  end
end

IO.gets("Enter your marks: ")
|> String.trim()
|> String.to_integer()
|> Grader.determine_grade()
|> IO.inspect(label: "Your grade is")
