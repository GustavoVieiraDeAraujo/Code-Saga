class VaultOpener
  def board_combination(movement_list, repeated_path_time_loss, running_time, max_time)
    tempo_gasto = 0
    movimentos_john = []
    movimentos_realizados = []
    movement_list = movement_list.split(" -> ")

    (0..(movement_list.length()-2)).step(1) do |index|
      movimento = [movement_list[index],movement_list[index+1]].sort
      if !(movimento.include? "C")
        movimentos_john.push([movimento[0],"C"].sort)
        movimentos_john.push(["C",movimento[1]].sort)
      else
        movimentos_john.push(movimento)
      end
    end

    movimentos_john.each do |movimento|
      if(movimentos_realizados.include? movimento)
        tempo_gasto += (repeated_path_time_loss+running_time)
      else
        movimentos_realizados.push(movimento)
        tempo_gasto += running_time
      end
    end  

    if (tempo_gasto <= max_time)
      ["Cofre aberto", "Tempo sobrando no relógio: #{max_time-tempo_gasto}"]
    else
      ["Cofre fechado", "Tempo a mais necessário: #{-1*(max_time-tempo_gasto)}"]
    end
  end
end