defmodule Savepass.Information do
  use Savepass.Web, :model

  @type_kind %{
    Text: "Text",
    Password: "Password"
  }

  def types, do: @type_kind

  schema "informations" do
    field :description, :string
    field :active, :boolean, default: false
    field :type, :string
    field :title, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:description, :active, :type, :title])
    |> validate_required([:description, :active, :type, :title])
  end
end
