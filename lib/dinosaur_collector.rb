class DinosaurCollector
  def toy_collecting(toys_positions, dino_position, battery)
    brinquedos_recuperados = 0
    caminho_percorrido = [dino_position]
    quantidade_brinquedos = toys_positions.length()
    
    while (quantidade_brinquedos > 0)
      x_dino = dino_position[0]
      y_dino = dino_position[1]
      distancia_brinquedos = []
      toys_positions.each do |toy|
        x_toy = toy[0]
        y_toy = toy[1]
        distancia_dois_pontos = (((x_toy - x_dino)**2) + ((y_toy - y_dino)**2))**0.5
        distancia_brinquedos.push(distancia_dois_pontos)
      end
      if (battery-distancia_brinquedos.min >= 0)
        pos_brinquedo_mais_perto = distancia_brinquedos.find_index(distancia_brinquedos.min)
        dino_position = toys_positions[pos_brinquedo_mais_perto]
        caminho_percorrido.push(dino_position)
        toys_positions.delete_at(pos_brinquedo_mais_perto)

        quantidade_brinquedos -= 1
        brinquedos_recuperados += 1
        battery -= distancia_brinquedos.min
      else
        break
      end
    end
    [caminho_percorrido, brinquedos_recuperados, battery.round(2)]
  end
end