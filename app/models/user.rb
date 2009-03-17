class User < ActiveRecord::Base

  belongs_to :sector

  attr_accessor :password, :password_confirmation, :password_atual, :conf_senha,
  :conf_senha_confirmation, :tipo_formulario

  before_validation_on_update :get_senha
  before_validation :text_upper
  before_create :digest_password
  before_update :digest_password
  after_save :clear_password

   validates_presence_of :login, :message => 'Campo login não pode estar em branco.'
  validates_presence_of :nome, :message => 'Campo nome não pode estar em branco.'
  validates_presence_of :password, :message => 'Campo Senha não pode estar em branco.', :if => :get_formulario
  validates_presence_of :password_confirmation, :message => 'Campo Confirma Senha não pode estar em branco.', :if => :get_formulario
  validates_presence_of :password_atual, :on => :update, :message => 'Campo Senha Atual não pode estar em branco.', :if => :get_formulario

  validates_uniqueness_of :login, :message => 'Login já cadastrado na base de dados.'
  validates_confirmation_of :password, :message => 'Campo Senha e Confirma Senha não conferem.'
  validates_confirmation_of :conf_senha, :message =>  'Campo Senha Atual não confere.'

  def self.digest(message)
    Digest::SHA1.hexdigest(message)
  end

  protected
  def digest_password
    if self.tipo_formulario != 'edita_usuario'
    (self.login).upcase!
    (self.password).upcase!
    self.senha = User.digest("#{self.login}#{self.password}") if password
    end
  end

  def clear_password
    self.password = ''
    self.password_confirmation = ''
  end

  def text_upper
    (self.login).upcase!
    (self.nome).upcase!
  end

  def get_senha
    if self.tipo_formulario != 'edita_usuario'
    (self.login).upcase!
    (self.password_atual).upcase!
    self.conf_senha_confirmation = User.digest("#{self.login}#{self.password_atual}") if password_atual
    self.conf_senha = "#{self.senha}"
    end
  end

  def get_formulario
    self.tipo_formulario != 'edita_usuario'
  end

  def self.search(pesquisar, page)
    paginate :per_page => 10, :page => page,
             :conditions => ['nome like ?', "%#{pesquisar}%"],
             :order => 'nome'
  end

end
