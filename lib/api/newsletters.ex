defmodule Api.Newsletters do
  @moduledoc """
  The Newsletters context.
  """

  import Ecto.Query, warn: false
  alias Api.Repo

  alias Api.Newsletters.Newsletter

  @doc """
  Returns the list of newsletters.

  ## Examples

      iex> list_newsletters()
      [%Newsletter{}, ...]

  """
  def list_newsletters do
    Repo.all(Newsletter)
  end

  @doc """
  Gets a single newsletter.

  Raises `Ecto.NoResultsError` if the Newsletter does not exist.

  ## Examples

      iex> get_newsletter!(123)
      %Newsletter{}

      iex> get_newsletter!(456)
      ** (Ecto.NoResultsError)

  """
  def get_newsletter!(id), do: Repo.get!(Newsletter, id)

  @doc """
  Creates a newsletter.

  ## Examples

      iex> create_newsletter(%{field: value})
      {:ok, %Newsletter{}}

      iex> create_newsletter(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_newsletter(attrs \\ %{}) do
    %Newsletter{}
    |> Newsletter.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a newsletter.

  ## Examples

      iex> update_newsletter(newsletter, %{field: new_value})
      {:ok, %Newsletter{}}

      iex> update_newsletter(newsletter, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_newsletter(%Newsletter{} = newsletter, attrs) do
    newsletter
    |> Newsletter.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a newsletter.

  ## Examples

      iex> delete_newsletter(newsletter)
      {:ok, %Newsletter{}}

      iex> delete_newsletter(newsletter)
      {:error, %Ecto.Changeset{}}

  """
  def delete_newsletter(%Newsletter{} = newsletter) do
    Repo.delete(newsletter)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking newsletter changes.

  ## Examples

      iex> change_newsletter(newsletter)
      %Ecto.Changeset{data: %Newsletter{}}

  """
  def change_newsletter(%Newsletter{} = newsletter, attrs \\ %{}) do
    Newsletter.changeset(newsletter, attrs)
  end
end
