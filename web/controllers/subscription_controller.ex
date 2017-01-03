defmodule Mtnblog.SubscriptionController do
  use Mtnblog.Web, :controller

  def challenge(conn, %{"hub.challenge" => challenge}) do
    text(conn, challenge)
  end

  def callback(conn, _params) do
  end
end
