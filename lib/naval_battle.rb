class NavalBattle
  def initialize(player_a, player_b, matrix_size, attacks)
    @attacks = attacks
    @player_a = player_a
    @player_b = player_b
    @matrix_size = matrix_size
  end
  def create_matrix(matrix_size)
    eixo_x, eixo_y = matrix_size.split('x').map(&:to_i)
    Array.new(eixo_y) { Array.new(eixo_x, '0') }
  end
  def positions_ships(player_matrix, ships_position)
    symbol_map = {
      boias: 'B',
      corveta: 'c',
      cruzador: 'C',
      submarino: 'S',
      porta_avioes: 'P',
      navio_de_guerra: 'N'
    }
    ships_position.each do |chave, valor|
      symbol = symbol_map[chave]
      valor.each do |coordenada|
        player_matrix[coordenada[0]][coordenada[1]] = symbol
      end
    end
    player_matrix
  end
  def attack(position, player_matrix)
    symbol_values = {
      '0' => 0,
      'B' => -3,
      'c' => 5,
      'C' => 3,
      'S' => 3,
      'P' => 1,
      'N' => 2
    }
    symbol = player_matrix[position[0]][position[1]]
    player_matrix[position[0]][position[1]] = 'X'
    symbol_values[symbol] || 0
  end
  def sunken_ships(endgame_matrix, ships_position)
    destroyed_ships_score = 0
    ships_position.each do |ship_type, positions|
      next if ship_type == :boias
      if positions.all? { |pos| endgame_matrix[pos[0]][pos[1]] == 'X' }
        destroyed_ships_score += 3
      else
        positions.reject! { |pos| endgame_matrix[pos[0]][pos[1]] == 'X' }
      end
    end
    destroyed_ships_score
  end
  def execute_attacks(player_matrix_a, player_matrix_b, attacks)
    pontos_a = 0
    pontos_b = 0
    navios_a = @player_a
    navios_b = @player_b
    attacks.each_line do |ataque|
      quem_ataca, posicao_atacada = ataque.split(" -> ")
      posicao_atacada = posicao_atacada.delete('[]').split(',').map(&:to_i)
      if quem_ataca == 'A'
        pontos_a += attack(posicao_atacada, player_matrix_b)
      else
        pontos_b += attack(posicao_atacada, player_matrix_a)
      end
    end
    pontos_a += sunken_ships(player_matrix_b, @player_b)
    pontos_b += sunken_ships(player_matrix_a, @player_a)
    if pontos_a > pontos_b
      ["Jogador A", pontos_a, pontos_b, player_matrix_b]
    else 
      ["Jogador B", pontos_a, pontos_b, player_matrix_a]
    end
  end
  def result
    matriz_a = create_matrix(@matrix_size)
    matriz_b = create_matrix(@matrix_size)
    positions_ships(matriz_a, @player_a)
    positions_ships(matriz_b, @player_b)
    vencedor, pontos_a, pontos_b, matriz = execute_attacks(matriz_a, matriz_b, @attacks)
    {
      vencedor: vencedor,
      pontos_a: pontos_a,
      pontos_b: pontos_b,
      matriz: matriz
    }
  end
end

