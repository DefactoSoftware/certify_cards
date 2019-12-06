defmodule CertifyCards.Devices do
  alias CertifyCards.Repo
  alias __MODULE__.Device

  def get_by_code(code) do
    {:ok, Repo.get_by(Device, code: code)}
  end
end
