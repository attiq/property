class CreatePropertyImages < ActiveRecord::Migration
  def self.up
    create_table :property_images do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :property_images
  end
end
