class CreateZones < ActiveRecord::Migration
  def self.up
    create_table :zones do |t|
      t.references :city
      t.string :name

      t.timestamps
    end

    add_index :zones, :city_id
  end

  def self.down
    drop_table :zones
  end
end
