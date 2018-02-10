defmodule Eeval.UserFactory do
  defmacro __using__(_opts) do
    quote do
      alias Eeval.Accounts.User

      def user_factory do
        password = "pswd" <> to_string(:os.system_time(:millisecond))
        %User{
          first_name: Faker.Name.first_name,
          last_name: Faker.Name.last_name,
          username: Faker.Internet.user_name,
          email: Faker.Internet.email,
          password: password,
          password_confirmation: password,
        }
      end
    end
  end
end
