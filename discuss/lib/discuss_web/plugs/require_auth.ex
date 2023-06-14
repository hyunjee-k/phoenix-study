defmodule DiscussWeb.Plugs.RequireAuth do
  import Plug.Conn
  import Phoenix.Controller
  use DiscussWeb, :verified_routes # this is key to redirect

  def init(_params) do
  end

  def call(conn, _params) do
    if conn.assigns[:user] do
      conn
    else
      conn
      |> put_flash(:error, "You must be logged in.")
      |> redirect(to: ~p"/topics")
      |> halt()
      # halt/0 함수가 호출되면 후속 미들웨어나 핸들러 함수가 실행되지 않고 현재의 Plug.Conn 반환
    end
  end

end