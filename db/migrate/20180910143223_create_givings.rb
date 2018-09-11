class CreateGivings < ActiveRecord::Migration[5.2]
  def change
    create_table :givings do |t|
      t.integer :giver_id
      t.integer :pet_id
      t.datetime :giving_date

      t.timestamps
    end
  end
end
