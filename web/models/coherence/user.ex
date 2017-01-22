defmodule Savepass.User do
  use Savepass.Web, :model
  use Coherence.Schema

  @sex_kind %{
    male: "Male",
    female: "Female"
  }

  def genres, do: @sex_kind

  schema "users" do
    field :name, :string
    field :email, :string
    field :record, :string
    field :sex, :string
    coherence_schema

    timestamps
  end

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:name, :email, :record, :sex] ++ coherence_fields)
    |> validate_required([:name, :email, :record, :sex])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> unique_constraint(:record)
    |> validate_coherence(params)
  end
end
