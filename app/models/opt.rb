class Opt < ActiveRecord::Base

  OPT = {
    :online => true,
    :city => "Sig@ Cidade Teste",
    :enable_gis => true,
    :enable_modules => true
  }

  validates_presence_of :key, :value


  def method_missing(m)
    OPT.each { |o| return o if m =~ o.key }
    super
  end

end
