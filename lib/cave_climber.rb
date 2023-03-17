class CaveClimber
  def movement(map, last_position, current_position, character_height)
    height = map[current_position[0]][current_position[1]]
    max_height = height + character_height
    min_height = [height - character_height, 0].max

    in_allowed_range = ->(h) { h.between?(min_height, max_height) }

    north_y = current_position[0] - 1
    south_y = current_position[0] + 1
    east_x = current_position[1] + 1
    west_x = current_position[1] - 1

    in_map_range = ->(y, x) { y.between?(0, map.length - 1) && x.between?(0, map[0].length - 1) }

    north = in_map_range.call(north_y, current_position[1]) ? map[north_y][current_position[1]] : nil
    south = in_map_range.call(south_y, current_position[1]) ? map[south_y][current_position[1]] : nil
    east = in_map_range.call(current_position[0], east_x) ? map[current_position[0]][east_x] : nil
    west = in_map_range.call(current_position[0], west_x) ? map[current_position[0]][west_x] : nil

    possible_moves = [
      { position: [north_y, current_position[1]], height: north },
      { position: [south_y, current_position[1]], height: south },
      { position: [current_position[0], east_x], height: east },
      { position: [current_position[0], west_x], height: west }
    ]

    allowed_moves = possible_moves.select do |move|
      move[:height] && in_allowed_range.call(move[:height]) && move[:position] != last_position
    end

    if allowed_moves.any?
      last_position = current_position
      current_position = allowed_moves.first[:position]
    end

    current_position
  end
  def treasure_path(map, positions, h_andre, h_kana)
    posicao_atual_kana = positions[:kana]
    posicao_atual_andre = positions[:andre]
    posicao_tesouro = positions[:tesouro]
  
    ultima_posicao_kana = 'nenhuma'
    ultima_posicao_andre = 'nenhuma'
    
    caminho_percorrido_kana = [posicao_atual_kana]
    caminho_percorrido_andre = [posicao_atual_andre]
    
    andre_encontrou_kana = posicao_atual_andre != posicao_atual_kana
    kana_encontrou_tesouro = !caminho_percorrido_kana.include?(posicao_tesouro)
    andre_encontrou_tesouro = !caminho_percorrido_andre.include?(posicao_tesouro)
  
    while andre_encontrou_kana && kana_encontrou_tesouro && andre_encontrou_tesouro
      posicao_atual_kana = movement(map, ultima_posicao_kana, posicao_atual_kana, h_kana)
      posicao_atual_andre = movement(map, ultima_posicao_andre, posicao_atual_andre, h_andre)
  
      ultima_posicao_kana = caminho_percorrido_kana.last
      ultima_posicao_andre = caminho_percorrido_andre.last
  
      caminho_percorrido_kana.push(posicao_atual_kana)
      caminho_percorrido_andre.push(posicao_atual_andre)
  
      andre_encontrou_kana = posicao_atual_andre != posicao_atual_kana
      kana_encontrou_tesouro = !caminho_percorrido_kana.include?(posicao_tesouro)
      andre_encontrou_tesouro = !caminho_percorrido_andre.include?(posicao_tesouro)
    end
  
    if !andre_encontrou_kana
      string_kana = 'Encontro: Kana: '+ caminho_percorrido_kana.map{|caminho| "#{caminho}"}.join(' -> ')
      string_andre = ' | André: '+ caminho_percorrido_andre.map{|caminho| "#{caminho}"}.join(' -> ')
      return string_kana + string_andre
    elsif !kana_encontrou_tesouro
      string_kana = 'Kana: '+caminho_percorrido_kana.map{|caminho| "#{caminho}"}.join(' -> ')
      return string_kana
    elsif !andre_encontrou_tesouro
      string_andre = 'André: '+caminho_percorrido_andre.map{|caminho| "#{caminho}"}.join(' -> ')
      return string_andre
    end
  end
end