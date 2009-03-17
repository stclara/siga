# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090317010758) do

  create_table "reports", :force => true do |t|
    t.string   "relatorio",  :limit => 100
    t.string   "caminho",    :limit => 160
    t.string   "usuario",    :limit => 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sectors", :force => true do |t|
    t.string   "setor",       :limit => 100
    t.string   "endereco",    :limit => 100
    t.string   "responsavel", :limit => 100
    t.string   "numero",      :limit => 40
    t.string   "bairro",      :limit => 40
    t.string   "cidade",      :limit => 40
    t.string   "uf",          :limit => 2
    t.string   "cep",         :limit => 10
    t.string   "fone1",       :limit => 13
    t.string   "fone2",       :limit => 13
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sectors", ["setor"], :name => "index_sectors_on_setor", :unique => true

  create_table "users", :force => true do |t|
    t.string   "login",      :limit => 5
    t.string   "nome",       :limit => 100
    t.string   "senha",      :limit => 40
    t.date     "nascimento"
    t.string   "adm",        :limit => 3
    t.string   "opr",        :limit => 3
    t.string   "ger",        :limit => 3
    t.integer  "sector_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
