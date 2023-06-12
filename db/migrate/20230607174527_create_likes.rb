class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |v|
      v.belongs_to :event,foreign_key: true
      v.belongs_to :user,foreign_key:true
  end
  end
end
