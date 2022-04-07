defmodule Api.Email do
  alias Mailchimp

  def get_all_lists() do
    Mailchimp.Account.get() |> elem(1) |> Mailchimp.Account.lists()
  end
end
