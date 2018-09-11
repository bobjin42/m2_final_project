class CreateAdoptions < ActiveRecord::Migration[5.2]
  def change
    create_table :adoptions do |t|
      t.integer :adoptor_id
      t.integer :pet_id
      t.datetime :adoption_date

      t.timestamps
    end
  end
end
