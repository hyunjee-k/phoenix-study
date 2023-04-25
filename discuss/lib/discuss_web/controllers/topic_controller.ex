defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller
  import Ecto

  alias Discuss.Repo
  alias Discuss.Discussions.Topic

  def index(conn, _params) do
    topics = Repo.all(Topic)
    render(conn, :index, topics: topics)
  end

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"topic" => topic}) do
    changeset = Topic.changeset(%Topic{}, topic)

    case Repo.insert(changeset) do
      # if post OK, redirect to index
      {:ok, _topic} ->
        conn
        # shows created message created to user
        |> put_flash(:info, "Topic Created")
        |> redirect(to: ~p"/topics")

      # if post not okay, redirect stay in form
      {:error, changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

end