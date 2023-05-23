# Discuss

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## Example of Create Table  
 * when you create a table, you need to create a migration file
 * if you want to create a table called users, you need to run the following command
   * mix ecto.gen.migration add_users
   * this will create a migration file in priv/repo/migrations
 * then you execute the following command
   * mix ecto.migrate
   * this will create a table called users in the database