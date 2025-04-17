module User
  module Form
    class Create < Reform::Form
      property :email
      property :password_digest

      validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
      validates :password_digest, length: 6..33
    end
  end
end
