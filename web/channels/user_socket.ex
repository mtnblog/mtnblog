defmodule Mtnblog.UserSocket do
  use Phoenix.Socket

  ## Channels
  channel "posts", Mtnblog.PostsChannel

  ## Transports
  transport :websocket, Phoenix.Transports.WebSocket,
    timeout: 45_000

  def connect(_params, socket) do
    {:ok, socket}
  end

  def id(_socket), do: nil
end
