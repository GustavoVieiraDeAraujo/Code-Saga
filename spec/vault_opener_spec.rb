require 'spec_helper'

describe 'VaultOpener' do
  it '1: Recebe o caminho e os tempos e retorna o resultado' do
    movement_list = 'A -> C -> B'
    repeated_path_time_loss = 5
    running_time = 3
    max_time = 15

    expect(VaultOpener.new.board_combination(movement_list, repeated_path_time_loss, running_time, max_time)).to eq(
      ['Cofre aberto', 'Tempo sobrando no relógio: 9']
    )
  end

  it '2: Recebe o caminho e os tempos e retorna o resultado' do
    movement_list = 'A -> C -> B -> C'
    repeated_path_time_loss = 5
    running_time = 3
    max_time = 15

    expect(VaultOpener.new.board_combination(movement_list, repeated_path_time_loss, running_time, max_time)).to eq(
      ['Cofre aberto', 'Tempo sobrando no relógio: 1']
    )
  end

  it '3: Recebe o caminho e os tempos e retorna o resultado' do
    movement_list = 'A -> B -> A'
    repeated_path_time_loss = 3
    running_time = 2
    max_time = 20

    expect(VaultOpener.new.board_combination(movement_list, repeated_path_time_loss, running_time, max_time)).to eq(
      ['Cofre aberto', 'Tempo sobrando no relógio: 6']
    )
  end

  it '4: Recebe o caminho e os tempos e retorna o resultado' do
    movement_list = 'A -> C -> B -> C'
    repeated_path_time_loss = 7
    running_time = 3
    max_time = 15

    expect(VaultOpener.new.board_combination(movement_list, repeated_path_time_loss, running_time, max_time)).to eq(
      ['Cofre fechado', 'Tempo a mais necessário: 1']
    )
  end

  it '5: Recebe o caminho e os tempos e retorna o resultado' do
    movement_list = 'D -> E -> B -> A -> C'
    repeated_path_time_loss = 3
    running_time = 4
    max_time = 30

    expect(VaultOpener.new.board_combination(movement_list, repeated_path_time_loss, running_time, max_time)).to eq(
      ['Cofre fechado', 'Tempo a mais necessário: 7']
    )
  end

  it '6: Recebe o caminho e os tempos e retorna o resultado' do
    movement_list = 'A -> E -> D -> B -> E -> A'
    repeated_path_time_loss = 3
    running_time = 3
    max_time = 60

    expect(VaultOpener.new.board_combination(movement_list, repeated_path_time_loss, running_time, max_time)).to eq(
      ['Cofre aberto', 'Tempo sobrando no relógio: 12']
    )
  end
end