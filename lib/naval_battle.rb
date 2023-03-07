class NavalBattle
  def initialize(player_a, player_b, matrix_size, attacks)
    @attacks = attacks
    @player_a = player_a
    @player_b = player_b
    @matrix_size = matrix_size
  end

  def create_matrix(matrix_size)
    matrix_size = matrix_size.split('x')
    eixo_x = matrix_size[0].to_i
    eixo_y = matrix_size[1].to_i

    matriz = []
    (1..eixo_y).step(1) do |y|
      matriz.push(Array.new(eixo_x){|x| x = '0'})
    end
    matriz
  end

  def positions_ships(player_matrix, ships_position)
    ships_position.each do |chave, valor|
      case chave 
      when :boias
        valor.each do |coordenada|
          player_matrix[coordenada[0]][coordenada[1]] = 'B'
        end
      when :corveta
        valor.each do |coordenada|
          player_matrix[coordenada[0]][coordenada[1]] = 'c'
        end
      when :cruzador
        valor.each do |coordenada|
          player_matrix[coordenada[0]][coordenada[1]] = 'C'
        end
      when :submarino
        valor.each do |coordenada|
          player_matrix[coordenada[0]][coordenada[1]] = 'S'
        end
      when :porta_avioes
        valor.each do |coordenada|
          player_matrix[coordenada[0]][coordenada[1]] = 'P'
        end
      when :navio_de_guerra
        valor.each do |coordenada|
          player_matrix[coordenada[0]][coordenada[1]] = 'N'
        end
      end
    end
    player_matrix
  end

  def attack(position, player_matrix)
    embarcacao = player_matrix[position[0]][position[1]] 
    player_matrix[position[0]][position[1]] = 'X'
    case embarcacao 
    when '0'
      0
    when 'B'
      -3
    when 'c'
      5
    when 'C'
      3
    when 'S'
      3
    when 'P'
      1
    when 'N'
      2
    end
  end

  def sunken_ships(endgame_matrix, ships_position)
    pontuacao_por_embarcacao_naufragada = 0
    ships_position.values.each do |valor|
      valor.each do |posicao|
        if(endgame_matrix[posicao[0]][posicao[1]] == 'X')
          index = valor.find_index(posicao)
          valor[index] = 'X'
        end
      end
    end
    ships_position.each do |chave, valor|
      if chave != :boias
        while valor.include? "X"
          valor.delete("X")
        end
        if(valor.empty?)
          pontuacao_por_embarcacao_naufragada += 3
        end
      end
    end
    pontuacao_por_embarcacao_naufragada
  end

  def execute_attacks(player_matrix_a, player_matrix_b, attacks)
    pontos_a = 0
    pontos_b = 0

    navios_a = @player_a
    navios_b = @player_b
    
    attacks = attacks.split("\n")
    attacks.each do |ataque|
      ataque = ataque.split(" -> ")
      quem_ataca = ataque[0]
      posicao_atacada = ataque[1].sub('[', '').sub(']', '').split(",").map{ |x| x.to_i}
      if( quem_ataca == 'A')
        pontos_a += attack(posicao_atacada, player_matrix_b)
      else
        pontos_b += attack(posicao_atacada, player_matrix_a)
      end
    end

    pontos_a += sunken_ships(player_matrix_b, @player_b)
    pontos_b += sunken_ships(player_matrix_a, @player_a)
  
    if (pontos_a > pontos_b)
      ["Jogador A", pontos_a, pontos_b, player_matrix_b]
    else 
      ["Jogador B", pontos_a, pontos_b, player_matrix_a]
    end
  end

  def result()
    matriz_a = create_matrix(@matrix_size)
    matriz_b = create_matrix(@matrix_size)
    matriz_a = positions_ships(matriz_a, @player_a)
    matriz_b = positions_ships(matriz_b, @player_b)
    resultado = execute_attacks(matriz_a, matriz_b, @attacks)
    {vencedor: resultado[0] , pontos_a: resultado[1] , pontos_b: resultado[2] , matriz: resultado[3]}
  end
end

