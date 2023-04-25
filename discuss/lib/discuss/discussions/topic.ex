# this is the equivalent to a Model in RoR
defmodule Discuss.Discussions.Topic do
  # AppName.Context.Model
  use Ecto.Schema
  import Ecto.Changeset

  alias Discuss.Discussions.Topic

  schema "topics" do
    field :title, :string
    belongs_to :user, Discuss.Accounts.User
    has_many :comments, Discuss.Discussions.Comment

    timestamps()
  end

  # validation
  # struct = record in db
  # params = new properties we are updating struct with
  def changeset(struct, params \\ %{}) do
    struct
    # produces a changeset
    |> cast(params, [:title])
      # validators
    |> validate_required([:title])
  end
end