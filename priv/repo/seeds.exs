# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     CertifyCards.Repo.insert!(%CertifyCards.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
CertifyCards.Repo.delete_all(CertifyCards.Devices.Device)

CertifyCards.Repo.insert_all(CertifyCards.Devices.Device, [
  %{
    certificate_code: "KeKo",
    code: "917293874912374",
    inserted_at: NaiveDateTime.utc_now(),
    updated_at: NaiveDateTime.utc_now()
  }
])
