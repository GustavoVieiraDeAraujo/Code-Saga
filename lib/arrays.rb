# frozen_string_literal: true

# Classe de arrays, com metodos de converter converte_impares_por e converte_pares_por
class Arrays
  # Retorna lista com numeros impares convertidos para multiplos de um determinado numero.
  def self.converte_impares_por(lista, numero)
    impares = lista.select(&:odd?)
    [impares, impares.map { |impar| impar * numero }]
  end

  # Retorna lista com numeros pares convertidos para multiplos de um determinado numero.
  def self.converte_pares_por(lista, numero)
    pares = lista.select(&:even?)
    [pares, pares.map { |par| par * numero }]
  end
end
