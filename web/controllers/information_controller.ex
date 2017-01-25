defmodule Savepass.InformationController do
  use Savepass.Web, :controller

  alias Savepass.Information

  def index(conn, _params) do
    informations = Repo.all(Information)
    render(conn, "index.html", informations: informations)
  end

  def new(conn, _params) do
    changeset = Information.changeset(%Information{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"information" => information_params}) do
    changeset = Information.changeset(%Information{}, information_params)

    case Repo.insert(changeset) do
      {:ok, _information} ->
        conn
        |> put_flash(:info, "Information created successfully.")
        |> redirect(to: information_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    information = Repo.get!(Information, id)
    render(conn, "show.html", information: information)
  end

  def edit(conn, %{"id" => id}) do
    information = Repo.get!(Information, id)
    changeset = Information.changeset(information)
    render(conn, "edit.html", information: information, changeset: changeset)
  end

  def update(conn, %{"id" => id, "information" => information_params}) do
    information = Repo.get!(Information, id)
    changeset = Information.changeset(information, information_params)

    case Repo.update(changeset) do
      {:ok, information} ->
        conn
        |> put_flash(:info, "Information updated successfully.")
        |> redirect(to: information_path(conn, :show, information))
      {:error, changeset} ->
        render(conn, "edit.html", information: information, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    information = Repo.get!(Information, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(information)

    conn
    |> put_flash(:info, "Information deleted successfully.")
    |> redirect(to: information_path(conn, :index))
  end
end
