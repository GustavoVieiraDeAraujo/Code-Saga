class GameShow
  def commercial_breaks(breaks, maximum_time)
    validos = []
    (1..(breaks.length())).step(1) do |agrupamento|
      combinacao = breaks.combination(agrupamento).to_a
      combinacao.each do |possibilidade|
        if (possibilidade.inject(:+) <= maximum_time)
          validos.push(possibilidade)
        end
      end
    end
    
    maior_quantidade = 0
    validos.each do |intervalos|
      if( intervalos.length() > maior_quantidade)
        maior_quantidade = intervalos.length()
      end
    end
    
    if (validos.length() != 1)
      validos = validos.select{|x| ((x.length() == maior_quantidade))}
      maior_soma = 0
      validos.each do |intervalos|
        if( intervalos.inject(:+) > maior_soma)
          maior_soma = intervalos.inject(:+)
        end
      end
      validos = validos.select{|x| ((x.inject(:+) == maior_soma))}
    end
    
    (0..(validos.length()-1)).step(1) do |a|
      (0..(validos[a].length()-1)).step(1) do |b|
        posicao = breaks.find_index(validos[a][b])
        validos [a][b] = posicao
      end
    end

    validos
  end
end


breaks = [10, 12, 13, 14, 8, 7, 5, 20, 19, 9]
[0, 4, 5, 6, 9]
[10,8,7,5,9]
maximum_time = 40
GameShow.new.commercial_breaks(breaks, maximum_time)