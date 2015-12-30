class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.text :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country

      t.timestamps
    end
  end
end
