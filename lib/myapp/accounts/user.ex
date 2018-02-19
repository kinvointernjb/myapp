defmodule Myapp.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Myapp.Accounts.User
  alias Myapp.Blog.Post
  import Comeonin.Bcrypt


  schema "users" do
    field :encrypted_password, :string
    field :username, :string
    field :password, :string, virtual: true
    has_many :posts, Post

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :password])
    |> validate_required([:username, :password])
    |> encrypt_password
  end

  defp encrypt_password(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, add_hash(password, hash_key: :encrypted_password))
  end
  defp encrypt_password(changeset), do: changeset

end
