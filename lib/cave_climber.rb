class CaveClimber
  def movement (map, ultima_posicao, posicao_atual, h_personagem)
    limite_y = (map.length()-1)
    limite_x = (map[0].length()-1)
    altura_atual = map[posicao_atual[0]][posicao_atual[1]]
    altura_max_permitida = altura_atual+h_personagem
    altura_min_permitida = ((altura_atual-h_personagem) >= 0)?(altura_atual-h_personagem):0
    alturas_permitidas = ->(altura){(altura >= altura_min_permitida) and (altura <= altura_max_permitida)}
    
    y_norte = ((posicao_atual[0]-1) >= 0) ? (posicao_atual[0]-1) : nil
    y_sul = ((posicao_atual[0]+1) <= limite_y) ? (posicao_atual[0]+1) : nil
    x_leste = ((posicao_atual[1]+1) <= limite_x) ? (posicao_atual[1]+1) : nil
    x_oeste = ((posicao_atual[1]-1) >= 0) ? (posicao_atual[1]-1) : nil

    norte = (y_norte == nil) ? nil : map[y_norte][posicao_atual[1]]
    sul = (y_sul == nil) ? nil : map[y_sul][posicao_atual[1]]
    leste = (x_leste == nil)? nil : map[posicao_atual[0]][x_leste]
    oeste = (x_oeste == nil)? nil : map[posicao_atual[0]][x_oeste]

    if ( (norte != nil) and (alturas_permitidas.call(norte)) and (ultima_posicao != [y_norte, posicao_atual[1]]) )
      ultima_posicao = posicao_atual
      posicao_atual = [y_norte, posicao_atual[1]]
    elsif ( (sul != nil) and (alturas_permitidas.call(sul)) and (ultima_posicao != [y_sul, posicao_atual[1]]) )
      ultima_posicao = posicao_atual
      posicao_atual = [y_sul, posicao_atual[1]]
    elsif ( (leste != nil) and (alturas_permitidas.call(leste)) and (ultima_posicao != [posicao_atual[0], x_leste]) )
      ultima_posicao = posicao_atual
      posicao_atual = [posicao_atual[0], x_leste]
    elsif ( (oeste != nil) and (alturas_permitidas.call(oeste)) and (ultima_posicao != [posicao_atual[0], x_oeste]) )
      ultima_posicao = posicao_atual
      posicao_atual = [posicao_atual[0], x_oeste]
    end
    posicao_atual
  end

  def treasure_path(map, positions, h_andre, h_kana) 
    posicao_atual_kana = positions[:kana]
    posicao_atual_andre = positions[:andre]
    posicao_tesouro =  positions[:tesouro]

    ultima_posicao_kana = 'nenhuma'
    ultima_posicao_andre = 'nenhuma'
    
    caminho_percorrido_kana = [posicao_atual_kana]
    caminho_percorrido_andre = [posicao_atual_andre]
    
    andre_encontrou_kana = !(posicao_atual_andre == posicao_atual_kana)
    kana_encontrou_tesouro = !(caminho_percorrido_kana.include? posicao_tesouro)
    andre_encontrou_tesouro = !(caminho_percorrido_andre.include? posicao_tesouro)

    while( andre_encontrou_kana and kana_encontrou_tesouro and andre_encontrou_tesouro)
      posicao_atual_kana = movement(map, ultima_posicao_kana, posicao_atual_kana, h_kana)
      posicao_atual_andre = movement(map, ultima_posicao_andre, posicao_atual_andre, h_andre)

      ultima_posicao_kana = caminho_percorrido_kana[-1]
      ultima_posicao_andre = caminho_percorrido_andre[-1]

      caminho_percorrido_kana.push(posicao_atual_kana)
      caminho_percorrido_andre.push(posicao_atual_andre)

      andre_encontrou_kana = !(posicao_atual_andre == posicao_atual_kana)
      kana_encontrou_tesouro = !(caminho_percorrido_kana.include? posicao_tesouro)
      andre_encontrou_tesouro = !(caminho_percorrido_andre.include? posicao_tesouro)
    end

    if !(andre_encontrou_kana)
      string_kana = 'Encontro: Kana: '+ caminho_percorrido_kana.map{|caminho| "#{caminho}"}.join(' -> ')
      string_andre = ' | André: '+ caminho_percorrido_andre.map{|caminho| "#{caminho}"}.join(' -> ')
      return string_kana + string_andre
    elsif !(kana_encontrou_tesouro)
      string_kana = 'Kana: ' + caminho_percorrido_kana.map{|caminho| "#{caminho}"}.join(' -> ')
      return string_kana
    elsif !(andre_encontrou_tesouro)
      string_andre = 'André: '+ caminho_percorrido_andre.map{|caminho| "#{caminho}"}.join(' -> ')
      return string_andre
    end
  end
end