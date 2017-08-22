defmodule Savepass.Repo.Migrations.CreateInformation do
  use Ecto.Migration

  def change do
    create table(:informations) do
      add :description, :string
      add :active, :boolean, default: false, null: false
      add :type, :string
      add :title, :string

      timestamps()
    end

  end
end
