# User Profile Updater

You're given a `User` struct (you can define it first). Write an Elixir function `update_profile/3` that takes a `User` struct, a `field` (as an atom like `:name` or `:email`), and a `new_value`.

The function should return a *new* `User` struct with the specified `field` updated to `new_value`.

**Hint:** Remember how we update structs by creating a new one? The syntax looks like `%{struct | field: new_value}`. You'll need to use pattern matching or a `case` statement on the `field` argument to determine *which* field to update. And think about how the pipe operator might make your code cleaner if you had multiple fields to update, though for this specific challenge, a simple `case` might be more direct.