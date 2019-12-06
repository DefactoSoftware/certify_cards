defmodule CertifyCards.Repo.Migrations.AddCards do
  use Ecto.Migration

  def change do
    create table(:cards, primary_key: false) do
      add(:id, :uuid, primary: true)
      add(:user_code, :string)
      add(:code, :string)

      timestamps()
    end

    create(index(:cards, [:code]))
  end
end
