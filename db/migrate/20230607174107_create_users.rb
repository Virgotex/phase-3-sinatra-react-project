class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |v|
      v.string :name
      v.string :email
      v.string :password_digest
  end
end
end
