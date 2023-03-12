# frozen_string_literal: true

# Classe ArrayUtils com os metodos multiplos e tabuada
class ArrayUtils
  def self.multiplos(qtd, multiplo)
    (1..qtd).map { |n| multiplo * n }
  end

  def self.tabuada(numero)
    (1..numero).map { |n| Array.new(10) { |i| (i + 1) * n } }
  end
end
