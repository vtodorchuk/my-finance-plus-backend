module User
  module Contract
    class Create < Reform::Form
      property :email
      property :password_digest
      validates :email, presence: true
      validates :password_digest, presence: true

      validates_format_of :email,
                          with: /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i

      validates :password_digest, presence: true
    end
  end
end
