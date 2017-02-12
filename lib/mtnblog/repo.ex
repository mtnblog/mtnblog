defmodule Mtnblog.Repo do
  use Ecto.Repo, otp_app: :mtnblog
  use Scrivener, page_size: 10
end
