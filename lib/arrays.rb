class Arrays
  def self.converte_impares_por(lista, numero)
    impares = lista.select{|numero| numero % 2 != 0}
    [impares, impares.map{|impar| impar*numero}]
  end

  def self.converte_pares_por(lista, numero)
    pares = lista.select{|numero| numero % 2 == 0}
    [pares, pares.map{|par| par*numero}]
  end
end
