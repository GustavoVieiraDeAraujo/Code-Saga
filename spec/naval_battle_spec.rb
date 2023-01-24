require 'spec_helper'

describe 'NavalBattle' do
  it '1: Recebe as informações iniciais e determina um vencedor' do
    player_a = { navio_de_guerra: [[0,0],[0,1],[0,2],[0,3]] }
    player_b = { navio_de_guerra: [[1,0],[1,1],[1,2],[1,3]] }
    matrix_size = '4x4'
    attacks = <<~ATAQUES
                A -> [1,2]
                B -> [0,3]
                A -> [1,1]
                B -> [1,3]
                A -> [1,0]
                B -> [0,2]
                A -> [1,3]
              ATAQUES

    expect(NavalBattle.new(player_a, player_b, matrix_size, attacks).result).to eq(
      { vencedor: 'Jogador A', pontos_a: 11, pontos_b: 4, matriz: [['0','0','0','0'],
                                                                   ['X','X','X','X'],
                                                                   ['0','0','0','0'],
                                                                   ['0','0','0','0']]
      }
    )
  end

  it '2: Recebe as informações iniciais e determina um vencedor' do
    player_a = { navio_de_guerra: [[0,0],[0,1],[0,2],[0,3]], corveta: [[3,2],[3,3]] }
    player_b = { navio_de_guerra: [[1,0],[1,1],[1,2],[1,3]], corveta: [[2,1],[2,2]] }
    matrix_size = '4x4'
    attacks = <<~ATAQUES
                A -> [0,0]
                B -> [0,3]
                A -> [2,1]
                B -> [0,2]
                A -> [2,0]
                B -> [0,1]
                A -> [2,2]
                B -> [0,0]
              ATAQUES

    expect(NavalBattle.new(player_a, player_b, matrix_size, attacks).result).to eq(
      { vencedor: 'Jogador A', pontos_a: 13, pontos_b: 11, matriz: [['X','0','0','0'],
                                                                    ['N','N','N','N'],
                                                                    ['X','X','X','0'],
                                                                    ['0','0','0','0']]
      }
    )
  end

  it '3: Recebe as informações iniciais e determina um vencedor' do
    player_a = { navio_de_guerra: [[0,0],[0,1],[0,2],[0,3]], corveta: [[3,2],[3,3]], boias: [[1,0],[3,1]] }
    player_b = { navio_de_guerra: [[1,0],[1,1],[1,2],[1,3]], corveta: [[2,1],[2,2]], boias: [[2,0],[2,3]] }
    matrix_size = '4x4'
    attacks = <<~ATAQUES
                A -> [2,1]
                B -> [0,0]
                A -> [2,0]
                B -> [0,1]
                A -> [3,1]
                B -> [0,2]
                A -> [2,2]
                B -> [0,3]
              ATAQUES

    expect(NavalBattle.new(player_a, player_b, matrix_size, attacks).result).to eq(
      { vencedor: 'Jogador B', pontos_a: 10, pontos_b: 11, matriz: [['X','X','X','X'],
                                                                    ['B','0','0','0'],
                                                                    ['0','0','0','0'],
                                                                    ['0','B','c','c']]
      }
    )
  end

  it '4: Recebe as informações iniciais e determina um vencedor' do
    player_a = { navio_de_guerra: [[0,0],[0,1],[0,2],[0,3]], corveta: [[3,2],[3,3]],
                 submarino: [[1,0],[1,1],[1,2]], boias: [[1,3],[3,1]] }
    player_b = { navio_de_guerra: [[1,0],[1,1],[1,2],[1,3]], corveta: [[2,1],[2,2]],
                 submarino: [[0,0],[0,1],[0,2]], boias: [[2,0],[2,3]] }
    matrix_size = '4x4'
    attacks = <<~ATAQUES
                A -> [1,2]
                B -> [1,3]
                A -> [0,2]
                B -> [3,1]
                A -> [2,2]
                B -> [0,0]
                A -> [1,1]
                B -> [0,1]
                A -> [0,1]
                B -> [0,2]
                A -> [1,0]
                B -> [0,3]
              ATAQUES

    expect(NavalBattle.new(player_a, player_b, matrix_size, attacks).result).to eq(
      { vencedor: 'Jogador A', pontos_a: 17, pontos_b: 5, matriz: [['S','X','X','0'],
                                                                   ['X','X','X','N'],
                                                                   ['B','c','X','B'],
                                                                   ['0','0','0','0']]
      }
    )
  end

  it '5: Recebe as informações iniciais e determina um vencedor' do
    player_a = { navio_de_guerra: [[3,1],[3,2],[3,3],[3,4]], corveta: [[5,7],[6,7]],
                 submarino: [[6,1],[6,2],[6,3]], cruzador: [[0,1],[0,2],[0,3]], 
                 porta_avioes: [[4,1],[4,2],[4,3],[4,4],[4,5],[4,6],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6]],
                 boias: [[4,7],[7,7]] }
    player_b = { navio_de_guerra: [[5,3],[5,4],[5,5],[5,6]], corveta: [[7,3],[7,4]],
                 submarino: [[0,4],[0,5],[0,6]], cruzador: [[4,7],[5,7],[6,7]], 
                 porta_avioes: [[2,1],[3,1],[4,1],[5,1],[6,1],[7,1],[2,2],[3,2],[4,2],[5,2],[6,2],[7,2]],
                 boias: [[0,2],[0,3]] }
    matrix_size = '8x8'
    attacks = <<~ATAQUES
                A -> [5,3]
                B -> [4,1]
                A -> [5,4]
                B -> [4,3]
                A -> [5,5]
                B -> [4,6]
                A -> [5,6]
                B -> [4,5]
                A -> [7,3]
                B -> [5,1]
                A -> [7,4]
                B -> [5,2]
                A -> [0,4]
                B -> [5,3]
                A -> [0,5]
                B -> [5,4]
                A -> [0,6]
                B -> [4,2]
                A -> [4,7]
                B -> [5,5]
                A -> [5,7]
                B -> [5,7]
                A -> [6,7]
                B -> [4,4]
                A -> [7,5]
                B -> [0,1]
                A -> [0,3]
                B -> [0,2]
                A -> [2,1]
                B -> [0,3]
                A -> [3,1]
                B -> [6,7]
                A -> [4,1]
                B -> [3,1]
                A -> [5,1]
                B -> [4,7]
                A -> [6,1]
                B -> [3,3]
                A -> [7,1]
                B -> [3,2]
                A -> [2,2]
                B -> [3,4]
                A -> [3,2]
                B -> [6,1]
                A -> [4,2]
                B -> [6,2]
                A -> [5,2]
                B -> [6,3]
                A -> [6,2]
                B -> [7,7]
                A -> [7,2]
                B -> [5,6]
              ATAQUES

    expect(NavalBattle.new(player_a, player_b, matrix_size, attacks).result).to eq(
    { vencedor: 'Jogador A', pontos_a: 60, pontos_b: 57, matriz: [['0', '0', 'B', 'X', 'X', 'X', 'X', '0'],
                                                                  ['0', '0', '0', '0', '0', '0', '0', '0'],
                                                                  ['0', 'X', 'X', '0', '0', '0', '0', '0'],
                                                                  ['0', 'X', 'X', '0', '0', '0', '0', '0'],
                                                                  ['0', 'X', 'X', '0', '0', '0', '0', 'X'],
                                                                  ['0', 'X', 'X', 'X', 'X', 'X', 'X', 'X'],
                                                                  ['0', 'X', 'X', '0', '0', '0', '0', 'X'],
                                                                  ['0', 'X', 'X', 'X', 'X', 'X', '0', '0']]
    }
    )
  end
end