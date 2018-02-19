defmodule Myapp.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Myapp.Blog.Post
  alias Myapp.Accounts.User


  schema "posts" do
    field :content, :string
    field :title, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, [:title, :content])
    |> validate_required([:title, :content])
  end
end
