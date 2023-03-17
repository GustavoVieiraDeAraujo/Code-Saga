class GameShow
  def commercial_breaks(breaks, maximum_time)
    validos = []
    (1..breaks.length).each do |agrupamento|
      combinacao = breaks.combination(agrupamento).to_a
      combinacao.each do |possibilidade|
        validos.push(possibilidade) if possibilidade.sum <= maximum_time
      end
    end
    maior_quantidade = validos.map(&:length).max
    if validos.length > 1
      validos = validos.select { |x| x.length == maior_quantidade }
      maior_soma = validos.map(&:sum).max
      validos = validos.select { |x| x.sum == maior_soma }
    end
    validos.map! { |intervalos| intervalos.map { |intervalo| breaks.index(intervalo) } }
    validos
  end
end