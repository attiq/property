class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.integer  :property_id,:null => false
      t.integer  :parent_id , :null=>true
      t.string   :content_type,:null => false
      t.string   :filename , :null=>false
      t.string   :thumbnail, :null => true
      t.integer  :size, :null => false
      t.integer  :width, :null => true
      t.integer  :height, :null => true

      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end
