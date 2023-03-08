class MartialTournament

  def extract_information_file(file_name)
    informação_extraida = {}
    file = File.open("./data/#{file_name}")
    file_data = file.read[6..].split("\nROUND\n").map{|luta| luta.split("\n")}
    file.close 
    (0..(file_data.length()-1)).step(1) do |numero_round|
      informação_extraida[(numero_round+1).to_s.to_sym] = file_data[numero_round]
    end
    informação_extraida
  end

  def execute_round(round_information, participating_points)
    nova_pontuação = {}
    round_information.each do |round|
      lutador_1 = round[0]
      lutador_2 = round[1]
      vencedor = round[2]

      pontos_lutador_1 = participating_points[lutador_1.to_sym]
      pontos_lutador_2 = participating_points[lutador_2.to_sym]
  
      if (vencedor == lutador_1)
        if (pontos_lutador_1 > pontos_lutador_2)
          pontos_lutador_1 += 1
        else
          diferenca = (pontos_lutador_2 - pontos_lutador_1)
          pontos_lutador_1 += (diferenca + 1)
          if (diferenca >= 3)
            pontos_lutador_2 -= 3
          else
            pontos_lutador_2 -= diferenca
          end
        end
      else
        if (pontos_lutador_1 < pontos_lutador_2)
          pontos_lutador_2 += 1
        else
          diferenca = (pontos_lutador_1 - pontos_lutador_2)
          pontos_lutador_2 += (diferenca + 1)
          if (diferenca >= 3)
            pontos_lutador_1 -= 3
          else
            pontos_lutador_1 -= diferenca
          end
        end
      end
  
      nova_pontuação[lutador_1.to_sym] = pontos_lutador_1
      nova_pontuação[lutador_2.to_sym] = pontos_lutador_2
    end
    nova_pontuação
  end

  def cria_rank(initial_points, first_score)
    array_initial_points = []

    initial_points.each_pair do |chave, value|
      array_initial_points.push([chave, value])
    end

    array_initial_points.each do |participante|
      empatados = array_initial_points.select{|lutador| lutador[1] == participante[1]}
      if (empatados.length() > 1)
        guerreiro_1 = empatados[0][0]
        guerreiro_2 = empatados[1][0]
        initial_points.delete(guerreiro_1)
        initial_points.delete(guerreiro_2)
        if (first_score[guerreiro_1] > first_score[guerreiro_2])
          initial_points[guerreiro_2] = empatados[1][1] 
          initial_points[guerreiro_1] = empatados[0][1]
        else
          initial_points[guerreiro_1] = empatados[0][1]
          initial_points[guerreiro_2] = empatados[1][1] 
        end
      end
    end
    
    rank = {}
    participantes_ranqueados = initial_points.sort_by {|x| x[1]}.reverse
    (1..(participantes_ranqueados.length())).step(1) do |posicao|
      participante = participantes_ranqueados[posicao-1]
      rank[posicao.to_s.to_sym] =  "#{participante[0]}"+":"+"#{participante[1]}"
    end
    rank
  end

  def placements(match_results, initial_points, rounds)
    ranks = []
    first_score = initial_points
    informacoes_extraidas = extract_information_file(match_results)
    (1..rounds).step(1) do |numero_round|
      informacao_round = informacoes_extraidas[numero_round.to_s.to_sym]
      informacao_round = informacao_round.map{|round| round.sub(" x ",",").sub(" -> ",",").split(",")}
      ultimo_rank = initial_points
      initial_points = execute_round(informacao_round, initial_points)
      ranks.push(cria_rank(initial_points, first_score))
    end
    ranks
  end
end