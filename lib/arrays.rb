class Arrays
  def self.converte_impares_por(lista, numero)
    return [[], []] if lista.empty?

    impares = lista.select(&:odd?)
    [impares, impares.map { |impar| impar * numero }]
  end

  def self.converte_pares_por(lista, numero)
    return [[], []] if lista.empty?

    pares = lista.select(&:even?)
    [pares, pares.map { |par| par * numero }]
  end
end
