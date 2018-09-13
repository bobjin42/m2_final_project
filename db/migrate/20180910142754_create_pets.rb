class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :animal_type
      t.string :breed
      t.integer :age
      t.string :gender
      t.integer :store_id
      t.string :image
      t.boolean :status, :default => true
      t.timestamps
    end
  end
end
