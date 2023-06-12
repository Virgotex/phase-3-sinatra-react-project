class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |v|
      v.string :title
      v.string :description
      v.string :location
      v.string :date
      v.string :time
      v.belongs_to :user, foreign_key: true
      v.timestamps null:false
      v.belongs_to :category, foreign_key: true
  end
end
end
