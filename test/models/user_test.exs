defmodule Savepass.UserTest do
  use Savepass.ModelCase

  alias Savepass.User

  @valid_attrs %{
    sex: "Male",
    email: "some@content.com",
    name: "some content",
    record: "42",
    password: "secret",
    password_confirmation: "secret"
  }
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
