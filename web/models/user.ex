defmodule Ectoservice.User do
  use Ectoservice.Web, :model
  #before definie the database there we need to design the model
  #defstruct
  schema "users" do
      field :name, :string
      field :username, :string
      field :age, :integer
      field :details, :string
      field :password, :string, virtual: true
      field :password_hash, :string
      timestamps
  end

  def changeset(model,params \\ :empty) do
    model
    |> cast(params, ~w(name username age details), [])
    #validation works in here
    |> validate_length(:username, min: 1,max: 20)
  end
end
