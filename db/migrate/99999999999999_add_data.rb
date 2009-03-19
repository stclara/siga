class AddData < ActiveRecord::Migration
  def self.up
    Sector.create(:name => "TI")
    User.create(:login => "admin", :password => "admin", :password_confirmation => "admin", :email => "admin@siga.com")
  end

  def self.down
    Sector.delete_all
    User.delete_all
  end
end
