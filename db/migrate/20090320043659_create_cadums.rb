class CreateCadums < ActiveRecord::Migration
  def self.up
    create_table :cadums do |t|
      t.string :name, :null => false
      t.boolen :sex, :null => false, :default => false
      t.string :marital
      t.string :education
      t.string :profession
      t.string :house_type

      t.integer :revenue_cents, :income_cents, :rooms

      t.references :birthplace, :mom, :dad, :spouse
      t.date :born_at, :arrival_at

      t.timestamps
    end

    add_index :cadums, :name
    add_index :cadums, :sex
    add_index :cadums, :mom_id
    add_index :cadums, :dad_id
    add_index :cadums, :spouse_id
  end

  def self.down
    drop_table :cadums
  end
end
