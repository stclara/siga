class Sector < ActiveRecord::Base

  has_many :users

  validates_presence_of :setor, :message => "O campo Setor não pode estar em branco!"
  validates_uniqueness_of :setor, :message => "Setor já cadastrada na base de dados!"

  def self.search(pesquisar, page)
    paginate :per_page => 10, :page => page,
             :conditions => ['setor like ?', "%#{pesquisar}%"],
             :order => 'setor'
  end

end
