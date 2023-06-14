defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller
  import Ecto

  alias Discuss.Repo
  alias Discuss.Discussions.Topic

  plug(DiscussWeb.Plugs.RequireAuth when action in [:new, :create, :edit, :update, :delete])
  plug(:check_topic_owner when action in [:update, :edit, :delete]) # function plug

  def index(conn, _params) do
#    IO.inspects(conn.assigns)
    topics = Repo.all(Topic)
    render(conn, :index, topics: topics)
  end

  def show(conn, %{"id" => topic_id}) do
    topic = Repo.get!(Topic, topic_id)
    render(conn, :show, topic: topic)
  end

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"topic" => topic}) do
#    changeset = Topic.changeset(%Topic{}, topic)

    changeset = conn.assigns[:user]
      |> build_assoc(:topics)
      |> Topic.changeset(topic)

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

  def edit(conn, %{"id" => topic_id}) do
    topic = Repo.get(Topic, topic_id)
    changeset = Topic.changeset(topic)
    render(conn, :edit, topic: topic, changeset: changeset)
  end

  def update(conn, %{"id" => topic_id, "topic" => topic}) do
    old_topic = Repo.get(Topic, topic_id)
    changeset = Topic.changeset(old_topic, topic)

    case Repo.update(changeset) do
      {:ok, _topic} ->
        conn
        |> put_flash(:info, "Topic, Updated")
        |> redirect(to: ~p"/topics/#{topic_id}")

      {:error, changeset} ->
        render(conn, :edit, changeset: changeset, topic: old_topic)
    end
  end

  def delete(conn, %{"id" => topic_id}) do
    Repo.get!(Topic, topic_id) |> Repo.delete!()
    # ! 를 사용하면 존재하지 않을 경우 사용할 수 없다는 에러를 발생시킵니다.

    conn
    |> put_flash(:info, "Topic Deleted!")
    |> redirect(to: ~p"/topics")
  end

  def check_topic_owner(conn, _params) do
    %{params: %{"id" => topic_id}} = conn
    # fetch topic out of db IF user_id == to current user let through -> conn
    if Repo.get(Topic, topic_id).user_id == conn.assigns.user.id do
      conn
    else
      conn
      |> put_flash(:error, "You are not allowed to edit this topic")
      |> redirect(to: ~p"/topics")
      |> halt()
    end
  end
end