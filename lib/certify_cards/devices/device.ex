defmodule CertifyCards.Devices.Device do
  use Ecto.Schema

  alias __MODULE__

  @primary_key {:id, :binary_id, autogenerate: true}
  @timestamps_opts [type: :naive_datetime_usec]

  schema "devices" do
    field(:certificate_code, :string)
    field(:code, :string)

    timestamps()
  end
end
