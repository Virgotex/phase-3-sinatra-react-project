class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |v|
      v.text :content
      v.belongs_to :event,foreign_key: true
      v.belongs_to :user,foreign_key:true
    end
  end
end
