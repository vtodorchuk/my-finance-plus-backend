module User
  module Form
    class Create < Reform::Form
      property :email
      property :password_digest

      validates :email, length: 2..33
      validates :password_digest, numericality: true
    end
  end
end
