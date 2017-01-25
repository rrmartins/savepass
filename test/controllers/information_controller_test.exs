defmodule Savepass.InformationControllerTest do
  use Savepass.ConnCase

  alias Savepass.Information
  @valid_attrs %{active: true, description: "some content", title: "some content", type: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, information_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing informations"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, information_path(conn, :new)
    assert html_response(conn, 200) =~ "New information"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, information_path(conn, :create), information: @valid_attrs
    assert redirected_to(conn) == information_path(conn, :index)
    assert Repo.get_by(Information, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, information_path(conn, :create), information: @invalid_attrs
    assert html_response(conn, 200) =~ "New information"
  end

  test "shows chosen resource", %{conn: conn} do
    information = Repo.insert! %Information{}
    conn = get conn, information_path(conn, :show, information)
    assert html_response(conn, 200) =~ "Show information"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, information_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    information = Repo.insert! %Information{}
    conn = get conn, information_path(conn, :edit, information)
    assert html_response(conn, 200) =~ "Edit information"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    information = Repo.insert! %Information{}
    conn = put conn, information_path(conn, :update, information), information: @valid_attrs
    assert redirected_to(conn) == information_path(conn, :show, information)
    assert Repo.get_by(Information, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    information = Repo.insert! %Information{}
    conn = put conn, information_path(conn, :update, information), information: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit information"
  end

  test "deletes chosen resource", %{conn: conn} do
    information = Repo.insert! %Information{}
    conn = delete conn, information_path(conn, :delete, information)
    assert redirected_to(conn) == information_path(conn, :index)
    refute Repo.get(Information, information.id)
  end
end
