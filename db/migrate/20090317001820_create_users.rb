class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login, :limit => 5
      t.string :nome, :limit => 100
      t.string :senha, :limit => 40
      t.date :nascimento
      t.string :adm, :opr, :ger, :limit => 3
      t.references :sector
      t.timestamps
    end
    add_index :users, :login, :unique
    execute "ALTER TABLE users ADD FOREIGN KEY (sector_id) REFERENCES sectors (id)"
    execute "INSERT INTO users (login, nome, senha, sector_id, adm) VALUES ('ADMIN',
    'ADMINISTRADOR DO SISTEMA', 'bcb029a665ebf3002fae8a7a04ea0584065f4e84', 1, 'SIM')"
  end

  def self.down
    drop_table :users
  end
end
