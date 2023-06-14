defmodule DiscussWeb.Plugs.SetUser do
  import Plug.Conn

  alias Discuss.Repo
  alias Discuss.Accounts.User

  # 한 번만 호출 됨
  def init(_params) do
  end

  # 플러그가 실행 될 때마다 호출 됨
  def call(conn, _params) do
    user_id = get_session(conn, :user_id)

    cond do  # cond: 조건문
      user = user_id && Repo.get(User, user_id) ->
        assign(conn, :user, user)
      true ->
        assign(conn, :user, nil)
    end
  end

end