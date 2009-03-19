# -*- coding: utf-8 -*-
class User < ActiveRecord::Base
  belongs_to :sector
  has_many :publications

  acts_as_authentic :crypto_provider => Authlogic::CryptoProviders::BCrypt,
                    :logged_in_timeout => 30.minutes,
                    :login_field_validates_length_of_options => { :within => 3..30 },
                    :login_field_validates_format_of_options => { :message => I18n.t('authlogic.validates.format_login_field') },
                    :login_field_validates_uniqueness_of_options => { :allow_blank => false }

  attr_accessor :password, :password_confirmation, :password_atual, :conf_senha,
  :conf_senha_confirmation, :tipo_formulario

  validates_presence_of :login, :message => 'Campo login não pode estar em branco.'
  validates_presence_of :name, :message => 'Campo nome não pode estar em branco.'
  validates_presence_of :password, :message => 'Campo Senha não pode estar em branco.', :if => :get_formulario
  validates_presence_of :password_confirmation, :message => 'Campo Confirma Senha não pode estar em branco.', :if => :get_formulario
  #validates_presence_of :password_atual, :on => :update, :message => 'Campo Senha Atual não pode estar em branco.', :if => :get_formulario

  validates_uniqueness_of :login, :message => 'Login já cadastrado na base de dados.'
  validates_confirmation_of :password, :message => 'Campo Senha e Confirma Senha não conferem.'
  #validates_confirmation_of :conf_senha, :message =>  'Campo Senha Atual não confere.'

  def before_validation
    self.time_zone ||= "Brasilia"
    self.locale ||= "br"
  end

  def self.search(pesquisar, page)
    paginate :per_page => 10, :page => page,
             :conditions => ['name like ?', "%#{pesquisar}%"],
             :order => 'name'
  end

end
