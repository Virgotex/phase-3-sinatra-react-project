class AddColumnRegistrations < ActiveRecord::Migration[6.1]
  def change
    add_column :registrations, :name, :string
    add_column :registrations, :email, :string
  end
end
