module User
  module Contract
    class Create < Reform::Form
      property :email
      property :password_digest

      validates :email, presence: true
      validates :password_digest, presence: true
    end
  end
end
