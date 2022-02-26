defmodule Api.NewslettersTest do
  use Api.DataCase

  alias Api.Newsletters

  describe "newsletters" do
    alias Api.Newsletters.Newsletter

    import Api.NewslettersFixtures

    @invalid_attrs %{htmlContent: nil, name: nil, publish_date: nil, rawContent: nil}

    test "list_newsletters/0 returns all newsletters" do
      newsletter = newsletter_fixture()
      assert Newsletters.list_newsletters() == [newsletter]
    end

    test "get_newsletter!/1 returns the newsletter with given id" do
      newsletter = newsletter_fixture()
      assert Newsletters.get_newsletter!(newsletter.id) == newsletter
    end

    test "create_newsletter/1 with valid data creates a newsletter" do
      valid_attrs = %{htmlContent: "some htmlContent", name: "some name", publish_date: ~U[2022-02-25 22:02:00Z], rawContent: "some rawContent"}

      assert {:ok, %Newsletter{} = newsletter} = Newsletters.create_newsletter(valid_attrs)
      assert newsletter.htmlContent == "some htmlContent"
      assert newsletter.name == "some name"
      assert newsletter.publish_date == ~U[2022-02-25 22:02:00Z]
      assert newsletter.rawContent == "some rawContent"
    end

    test "create_newsletter/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Newsletters.create_newsletter(@invalid_attrs)
    end

    test "update_newsletter/2 with valid data updates the newsletter" do
      newsletter = newsletter_fixture()
      update_attrs = %{htmlContent: "some updated htmlContent", name: "some updated name", publish_date: ~U[2022-02-26 22:02:00Z], rawContent: "some updated rawContent"}

      assert {:ok, %Newsletter{} = newsletter} = Newsletters.update_newsletter(newsletter, update_attrs)
      assert newsletter.htmlContent == "some updated htmlContent"
      assert newsletter.name == "some updated name"
      assert newsletter.publish_date == ~U[2022-02-26 22:02:00Z]
      assert newsletter.rawContent == "some updated rawContent"
    end

    test "update_newsletter/2 with invalid data returns error changeset" do
      newsletter = newsletter_fixture()
      assert {:error, %Ecto.Changeset{}} = Newsletters.update_newsletter(newsletter, @invalid_attrs)
      assert newsletter == Newsletters.get_newsletter!(newsletter.id)
    end

    test "delete_newsletter/1 deletes the newsletter" do
      newsletter = newsletter_fixture()
      assert {:ok, %Newsletter{}} = Newsletters.delete_newsletter(newsletter)
      assert_raise Ecto.NoResultsError, fn -> Newsletters.get_newsletter!(newsletter.id) end
    end

    test "change_newsletter/1 returns a newsletter changeset" do
      newsletter = newsletter_fixture()
      assert %Ecto.Changeset{} = Newsletters.change_newsletter(newsletter)
    end
  end
end
