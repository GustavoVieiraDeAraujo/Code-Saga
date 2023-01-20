require 'spec_helper'

describe 'MartialTournament' do
  it '1: Recebe o arquivo de partidas e os pontos iniciais e retorna as colocações e pontos após 1 round' do
    match_results = 'match-results-1.txt'
    initial_points = { 'goku': 7, 'vegeta': 4, 'naruto': 5, 'sasuke': 1,
                       'sailor_moon': 6, 'bloom': 2, 'charizard': 3, 'bowser': 8}
    rounds = 1

    expect(MartialTournament.new.placements(match_results, initial_points, rounds)).to eq(
      [{ '1': 'bowser:9', '2': 'goku:8', '3': 'sailor_moon:7', '4': 'naruto:6', '5': 'vegeta:4',
         '6': 'charizard:3', '7': 'bloom:2', '8': 'sasuke:1' }]
    )
  end

  it '2: Recebe o arquivo de partidas e os pontos iniciais e retorna as colocações após 1 round' do
    match_results = 'match-results-2.txt'
    initial_points = { 'goku': 7, 'vegeta': 4, 'naruto': 5, 'sasuke': 1,
                       'sailor_moon': 6, 'bloom': 2, 'charizard': 3, 'bowser': 8}
    rounds = 1

    expect(MartialTournament.new.placements(match_results, initial_points, rounds)).to eq(
      [{ '1': 'charizard:9', '2': 'vegeta:8', '3': 'bloom:7', '4': 'sasuke:6', '5': 'bowser:5',
         '6': 'goku:4', '7': 'sailor_moon:3', '8': 'naruto:2' }]
    )
  end

  it '3: Recebe o arquivo de partidas e os pontos iniciais e retorna as colocações durante 2 rounds' do
    match_results = 'match-results-3.txt'
    initial_points = { 'goku': 7, 'vegeta': 4, 'naruto': 5, 'sasuke': 1,
                       'sailor_moon': 6, 'bloom': 2, 'charizard': 3, 'bowser': 8}
    rounds = 2

    expect(MartialTournament.new.placements(match_results, initial_points, rounds)).to eq(
      [{ '1': 'goku:9', '2': 'bowser:7', '3': 'sailor_moon:7', '4': 'naruto:6', '5': 'vegeta:4', '6': 'bloom:4',
         '7': 'charizard:2', '8': 'sasuke:1' }, { '1': 'bloom:10', '2': 'bowser:8', '3': 'sailor_moon:7', '4': 'charizard:7',
         '5': 'goku:6', '6': 'vegeta:5', '7': 'naruto:3', '8': 'sasuke:1'} ]
    )
  end

  it '4: Recebe o arquivo de partidas e os pontos iniciais e retorna as colocações após 1 round' do
    match_results = 'match-results-4.txt'
    initial_points = { 'goku': 12, 'vegeta': 11, 'naruto': 7, 'sasuke': 1,
                       'sailor_moon': 7, 'bloom': 2, 'charizard': 5, 'bowser': 8}
    rounds = 1

    expect(MartialTournament.new.placements(match_results, initial_points, rounds)).to eq(
      [{ '1': 'vegeta:13', '2': 'goku:11', '3': 'bowser:9', '4': 'sailor_moon:8', '5': 'naruto:7',
         '6': 'sasuke:6', '7': 'charizard:2', '8': 'bloom:2' }]
    )
  end

  it '5: Recebe o arquivo de partidas e os pontos iniciais e retorna as colocações durante 3 rounds' do
    match_results = 'match-results-4.txt'
    initial_points = { 'goku': 12, 'vegeta': 11, 'naruto': 7, 'sasuke': 1,
                       'sailor_moon': 7, 'bloom': 2, 'charizard': 5, 'bowser': 8}
    rounds = 3

    expect(MartialTournament.new.placements(match_results, initial_points, rounds)).to eq(
      [{ '1': 'vegeta:13', '2': 'goku:11', '3': 'bowser:9', '4': 'sailor_moon:8', '5': 'naruto:7',
         '6': 'sasuke:6', '7': 'charizard:2', '8': 'bloom:2' }, { '1': 'bowser:14', '2': 'sailor_moon:12',
         '3': 'vegeta:10', '4': 'goku:8', '5': 'charizard:8', '6': 'bloom:7', '7': 'naruto:4', '8': 'sasuke:3' },
       { '1': 'bowser:15', '2': 'sailor_moon:12', '3': 'goku:11', '4': 'sasuke:9', '5': 'vegeta:8', 
         '6': 'bloom:8', '7': 'charizard:5', '8': 'naruto:4'}]
    )
  end

  it '6: Recebe o arquivo de partidas e os pontos iniciais e retorna as colocações durante 5 rounds' do
    match_results = 'match-results-4.txt'
    initial_points = { 'goku': 12, 'vegeta': 11, 'naruto': 7, 'sasuke': 1,
                       'sailor_moon': 7, 'bloom': 2, 'charizard': 5, 'bowser': 8}
    rounds = 5

    expect(MartialTournament.new.placements(match_results, initial_points, rounds)).to eq(
      [{ '1': 'vegeta:13', '2': 'goku:11', '3': 'bowser:9', '4': 'sailor_moon:8', '5': 'naruto:7',
        '6': 'sasuke:6', '7': 'charizard:2', '8': 'bloom:2' }, { '1': 'bowser:14', '2': 'sailor_moon:12',
        '3': 'vegeta:10', '4': 'goku:8', '5': 'charizard:8', '6': 'bloom:7', '7': 'naruto:4', '8': 'sasuke:3' },
      { '1': 'bowser:15', '2': 'sailor_moon:12', '3': 'goku:11', '4': 'sasuke:9', '5': 'vegeta:8', 
        '6': 'bloom:8', '7': 'charizard:5', '8': 'naruto:4'}, { '1': 'bowser:16', '2': 'sailor_moon:13',
        '3': 'bloom:12', '4': 'charizard:9', '5': 'sasuke:9', '6': 'goku:8', '7': 'vegeta:5', '8': 'naruto:4'},
      { '1': 'bowser:17', '2': 'sailor_moon:14', '3': 'bloom:13', '4': 'naruto:10', '5': 'charizard:9',
        '6': 'goku:8', '7': 'sasuke:6', '8': 'vegeta:5' }]
    )
  end
end