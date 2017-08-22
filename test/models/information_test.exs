import Ecto.Query
defmodule Savepass.InformationTest do
  use Savepass.ModelCase

  alias Savepass.Information
  alias Savepass.Repo

  @valid_attrs %{
    active: true,
    description: "Description test",
    title: "Title test",
    type: "Password"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Information.changeset(%Information{}, @valid_attrs)
    assert changeset.valid?
  end

  test "list Informations" do
    Information.changeset(%Information{}, @valid_attrs)
    |> Repo.insert
    informations = Repo.all(Information)
    assert Enum.count(informations) == 1
  end

  test "get with success Information" do
    changeset = Information.changeset(%Information{}, @valid_attrs)
    Repo.insert(changeset)
    query = from inf in Information,
      where: inf.title == ^@valid_attrs.title
    information = List.first(Repo.all(query))
    assert information.description == @valid_attrs.description
  end

  test "changeset with invalid attributes" do
    changeset = Information.changeset(%Information{}, @invalid_attrs)
    refute changeset.valid?
  end
end
