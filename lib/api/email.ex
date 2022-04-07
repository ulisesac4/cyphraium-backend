defmodule Api.Email do
  alias Mailchimp

  def get_all_lists() do
    Mailchimp.Account.get() |> elem(1) |> Mailchimp.Account.lists()
  end

  def get_all_contacts_from_a_list(list) do
    Mailchimp.List.members(list, %{})
  end

  def send_emails(emails, content) do
    IO.inspect("I have sent all emails")
  end

  def send_newsletter_to_cyphraium(content) do
    get_all_lists()
    |> elem(1)
    |> Enum.find(fn element -> element.name === "Cyphraium" end)
    |> get_all_contacts_from_a_list()
    |> elem(1)
    |> send_emails("a testo")
  end
end
