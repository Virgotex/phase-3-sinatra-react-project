class CreateOrganisers < ActiveRecord::Migration[6.1]
  def change
    create_table :organisers do |v|
      v.string :name
      v.string :email
  end
  end
end
