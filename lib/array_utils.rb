# frozen_string_literal: true

# Classe ArrayUtils com os metodos multiplos e tabuada
class ArrayUtils
  # Retorna os múltiplos de um determinado número.
  def self.multiplos(qtd, multiplo)
    retorno = []
    (1..qtd).step(1) do |n|
      retorno.push(multiplo * n)
    end
    retorno
  end

  # Retorna a tabuada de determinados valores.
  def self.tabuada(numero)
    retorno = []
    (1..numero).step(1) do |n|
      retorno.push(multiplos(10, n))
    end
    retorno
  end
end
