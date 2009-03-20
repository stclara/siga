class CreateCadums < ActiveRecord::Migration
  def self.up
    create_table :cadums do |t|
      t.string :name
      t.string :sex
      t.string :marital_status
      t.date :birth
      t.string :birthplace
      t.string :time_residence
      t.string :profession
      t.integer :income
      t.string :housing
      t.string :type_housing
      t.string :type_house
      t.integer :room
      t.integer :revenue
      t.integer :habitantes

      t.timestamps
    end
  end

  def self.down
    drop_table :cadums
  end
end
