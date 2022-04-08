defmodule Api.Email do
  alias Mailchimp

  def get_all_lists() do
    Mailchimp.Account.get() |> elem(1) |> Mailchimp.Account.lists()
  end

  def get_all_contacts_from_a_list(list) do
    Mailchimp.List.members(list, %{})
  end

  def send_email(email, content) do
    IO.inspect("About to send email to ")
  end

  def send_emails(emails, content) do
    IO.inspect("About to send the newsletter")
    Enum.map(emails, fn email -> send_email(email, content) end)
    IO.inspect("Newsletter sent")
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
