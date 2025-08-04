defmodule User do
  defstruct name: "Guest", email: "guest@example.com", is_active: true
end

defmodule ProfileUpdater do
  def update_profile(user, field, new_value) do
    case field do
      :name -> %{user | name: new_value}
      :email -> %{user | email: new_value}
      :is_active -> %{user | is_active: new_value}
      _ -> user
    end
  end
end

defmodule Main do
  def run do
    guest = %User{}
    updated_user = ProfileUpdater.update_profile(guest, :name, "Shubhajit Halder")
    updated_user2 = ProfileUpdater.update_profile(updated_user, :email, "shubhajith85@gmail.com")
    IO.inspect(updated_user, label: "Updated User Profile 1")
    IO.inspect(updated_user2, label: "Updated User Profile 2")
  end
end

Main.run()
