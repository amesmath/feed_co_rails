class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :role
      t.string :status
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :last_login_at

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
