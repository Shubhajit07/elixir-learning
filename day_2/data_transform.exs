defmodule Transform do
  def pipeline() do
    users = [
      %{id: 1, name: "  alice ", score: "95"},
      %{id: 2, name: "bob  ", score: "88"},
      %{id: 3, name: "charlie", score: "abc"},
      %{id: 4, name: "david", score: "102"},
    ]

    transformed_users = Enum.filter(users, &filter_func/1)
                        |> Enum.map(fn user ->%{user | name: String.trim(user.name) |> String.capitalize()} end)
                        |> Enum.map(fn user -> %{user | score: String.to_integer(user.score)} end)
    avg_score = Enum.reduce(transformed_users, 0, &(&1.score+&2))
                |> Kernel./(Enum.count(transformed_users))

    IO.inspect(transformed_users, label: "Transformed users")
    IO.inspect(avg_score, label: "Average score")
  end

  defp filter_func(user) do
    case Integer.parse(user.score) do
      {s, ""} -> s<=100
      _ -> false
    end
  end
end

Transform.pipeline()
