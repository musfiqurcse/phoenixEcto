defmodule Ectoservice.UserController do
  use Ectoservice.Web, :controller
  alias Ectoservice.User
  def new(conn, _params) do
    changeset=User.changeset(%User{})
    #IO.inspect conn
    #render conn, "new.html", changeset: changeset
    redirect conn, external: "/"
  end
  def create(conn, %{"user" => user_param}) do
    #IO.inspect user_param
    changeset=User.changeset(%User{}, user_param)
    IO.inspect changeset
    {:ok, user} = Repo.insert(changeset)
    conn
    |> put_flash(:info, "#{user.name} created!")
    |> redirect(to: user_path(conn, :index))

  end
  def index(conn, _params) do
    users= Repo.all(User)
    render conn, "index.html", users: users
  end
end
