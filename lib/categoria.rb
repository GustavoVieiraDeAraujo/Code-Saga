class Categoria
  attr_accessor :nome
  def initialize(nome = 'Geral')
    @nome = nome
  end
end


teste =  Categoria.new('Teste')
p (teste)
teste =  Categoria.new()
p (teste)
