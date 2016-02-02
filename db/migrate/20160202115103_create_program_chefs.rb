class CreateProgramChefs < ActiveRecord::Migration
  def change
    create_table :program_chefs do |t|
      t.belongs_to :program, index: true
      t.belongs_to :chef_resource, index: true
      t.timestamps null: false
    end
  end
end
