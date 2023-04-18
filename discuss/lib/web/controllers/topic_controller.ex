defmodule Discuss.Web.TopicController do
  use Discuss.Web, :controller

  alias Discuss.Web.Topic

  def new(conn, params) do
    changeset = Topic.changeset(%Topic{}, %{})

    render(conn, "new.html", changeset: changeset)
  end

  def create(conn,  %{"topic" => topic}) do

  end

end