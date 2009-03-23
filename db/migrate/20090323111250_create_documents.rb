class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.references :cadum, :null => false
      t.string :kind, :null => false, :limit => 10
      t.string :value, :null => false
      t.string :note
      t.string :state

      t.timestamps
    end

    add_index :documents, :cadum_id
    add_index :documents, :kind
    add_index :documents, :state
    add_index :documents, [:kind, :cadum_id]
  end

  def self.down
    drop_table :documents
  end
end
