class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.polymorphic :addressable
      t.refrences :city
      t.string :street
      t.string :complement
      t.string :number
      t.string :zip_code

      t.timestamps
    end

    add_index :addresses, [:addressable_type, :addressable_id]
    add_index :addresses, :city_id
  end

  def self.down
    drop_table :addresses
  end
end
