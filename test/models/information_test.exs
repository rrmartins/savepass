defmodule Savepass.InformationTest do
  use Savepass.ModelCase

  alias Savepass.Information

  @valid_attrs %{active: true, description: "some content", title: "some content", type: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Information.changeset(%Information{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Information.changeset(%Information{}, @invalid_attrs)
    refute changeset.valid?
  end
end
