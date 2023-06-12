class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |v|
      v.string :name
  end
  end
end
