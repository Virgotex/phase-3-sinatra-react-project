class CreateRegistrations < ActiveRecord::Migration[6.1]
  def change
    create_table :registrations do |v|_
      v.belongs_to :event,foreign_key: true
      v.belongs_to :user,foreign_key:true
  end
  end
end
