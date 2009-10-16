class CreateProperties < ActiveRecord::Migration
  def self.up
    create_table :properties do |t|
      t.integer :user_id
      t.integer :status_id
      t.string :name
      t.float :price
      t.float :sqf
      t.integer :beds
      t.integer :baths
      t.string :street_address
      t.string :city
      t.integer :zip
      t.string :state
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :properties
  end
end
