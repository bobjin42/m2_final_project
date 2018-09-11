class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :branch_name

      t.timestamps
    end
  end
end
