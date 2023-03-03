class ArrayUtils
  def self.multiplos(qtd, multiplo)
    retorno = []
    (1..qtd).step(1) do |n|
      retorno.push(multiplo*n)
    end
    retorno
  end

  def self.tabuada(numero)
    retorno = []
    (1..numero).step(1) do |n|
      retorno.push(multiplos(10, n))
    end
    retorno
  end
end
