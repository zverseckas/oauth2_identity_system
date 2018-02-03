defimpl Bamboo.Formatter, for: Eeval.Accounts.User do
  def format_email_address(user, _opts) do
    fullname = "#{user.first_name} #{user.last_name}"
    {fullname, user.email}
  end
end
