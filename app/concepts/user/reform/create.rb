module User
  module Reform
    class Create < Reform::Form
      property :email
      property :password_digest

      validates :email, :password_digest, presence: true

      validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
      validates :password_digest, length: 6..33
    end
  end
end
