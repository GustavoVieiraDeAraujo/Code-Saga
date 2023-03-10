class ArrayUtils
  def self.compara(lista1, lista2)
    lista1.sort == lista2.sort
  end

  def self.divisiveis(divisor1, divisor2)
    retorno = [[],[],[]]
    (1..50).step(1) do |n|
      if (n%divisor1 == 0 and n%divisor2 == 0)
        retorno[0].push(n)
      elsif (n%divisor1 == 0)
        retorno[1].push(n)
      elsif (n%divisor2 == 0)
        retorno[2].push(n)
      end 
    end
    retorno
  end

  def self.soma(lista)
    lista.inject(:+)
  end

  def self.combinar(lista1, lista2)
    retorno = []
    (0..(lista1.length()-1)).step(1) do |a|
      (0..(lista2.length()-1)).step(1) do |b|
        retorno.push([lista1[a],lista2[b]])
      end
    end
    retorno
  end

end
