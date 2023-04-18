defmodule Discuss.Web.Topic do
  use Discuss.Web, :model

  schema "topics" do
    field :title, :string
  end

  def changeset(struct, attrs \\ %{}) do
    # 인자에서 \\ 를 사용하여 default 값을 정의한다. 즉, attrs 가 nil 이면 empty map 을 사용한다.

    struct
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end

# iex -S mix
# struct = %Discuss.Web.Topic{}
# attrs = %{title: "Great JS"}
# Discuss.Web.Topic.changeset(struct, attrs)