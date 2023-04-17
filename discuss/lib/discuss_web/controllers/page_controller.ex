defmodule DiscussWeb.PageController do
  # discuss/lib/discuss_web.ex 에서 controller 를 사용하도록 설정
  use Discuss.Web, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end
end
