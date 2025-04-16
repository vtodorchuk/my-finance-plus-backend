module User
  module Contract
    class Create < Reform::Form
      EMAIL_REGEX = /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\z/

      property :email
      property :password_digest
      validates :email, presence: true
      validates :password_digest, presence: true

      validates_format_of :email, with: EMAIL_REGEX
      validates :password_digest, presence: true
    end
  end
end
