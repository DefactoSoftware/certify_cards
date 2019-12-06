defmodule CertifyCards.Repo.Migrations.AddDevices do
  use Ecto.Migration

  def change do
    create table(:devices, primary_key: false) do
      add(:id, :uuid, primary: true)
      add(:certificate_code, :string)
      add(:code, :string)

      timestamps()
    end

    create(index(:devices, [:code]))
  end
end
