class CreateSectors < ActiveRecord::Migration
  def self.up
    create_table :sectors do |t|
      t.string :setor, :endereco, :responsavel, :limit => 100
      t.string :numero, :bairro, :cidade, :limit => 40
      t.string :uf, :limit => 2
      t.string :cep, :limit => 10
      t.string :fone1, :fone2, :limit => 13
      t.timestamps
    end
    add_index :sectors, :setor, :unique
    execute "INSERT INTO sectors (setor) VALUES ('ADMINISTRADOR DO SISTEMA')"
  end

  def self.down
    drop_table :sectors
  end
end
