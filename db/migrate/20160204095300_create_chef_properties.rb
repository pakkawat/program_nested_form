class CreateChefProperties < ActiveRecord::Migration
  def change
    create_table :chef_properties do |t|
      t.string :value
      t.string :value_type
      t.references :chef_resource, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
