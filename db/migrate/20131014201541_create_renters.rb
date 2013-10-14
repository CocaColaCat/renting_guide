class CreateRenters < ActiveRecord::Migration
  def change
    create_table :renters do |t|
      t.string :postcode
      t.string :email

      t.timestamps
    end
  end
end
