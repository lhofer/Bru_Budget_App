class CreateCosts < ActiveRecord::Migration
  belongs_to :user

  def change
    create_table :costs do |t|
      t.string :item
      t.float :cost
      t.string :location

      t.timestamps null: false
    end
  end
end
