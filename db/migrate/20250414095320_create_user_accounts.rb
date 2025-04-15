class CreateUserAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :user_accounts do |t|
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
