require 'spec_helper'
require 'calculadora'

describe 'Calculadora' do
  it '1: deve somar elementos corretamente' do
    expect(soma(1, 3)).to eq(4)
  end

  it '2: some numeros com resultado negativo' do
    expect(soma(1, -2)).to eq(-1)
  end

  it '3: subtrai numeros corretamente' do
    expect(subtracao(74, 60)).to eq(14)
  end

  it '4: subtrai numeros com zero como argumento' do
    expect(subtracao(0, 60)).to eq(-60)
  end

  it '5: multiplica numeros corretamente' do
    expect(multiplicacao(10, 42)).to eq(420)
  end

  it '6: multiplica numeros com zero como argumento' do
    expect(multiplicacao(10, 0)).to eq(0)
  end

  it '7: divide numeros corretamente' do
    expect(divisao(525, 5)).to eq(105)
  end

  it '8: exibe mensagem ao dividir por zero' do
    expect(divisao(10, 0)).to eq('Opa! Zero como divisor')
  end

  it '9: deve tirar raiz do numero corretamente' do
    expect(radiciacao(59049, 5)).to eq(9)
  end

  it '10: deve tirar raiz de 0 corretamente' do
    expect(radiciacao(0, 999)).to eq(0)
  end

  it '11: deve exibir mensagem de erro ao tirar raiz de numero negativo' do
    expect(radiciacao(-59049, 5)).to eq('Não é possível extrair raiz quadrada de um número negativo no conjunto dos números reais.')
  end

  it '12: deve elevar o numero corretamente' do
    expect(potenciacao(9, 5)).to eq(59049)
  end

  it '13: deve elevar o 0 corretamente' do
    expect(potenciacao(0, 999)).to eq(0)
  end

  it '14: deve elevar numero negativo corretamente' do
    expect(potenciacao(-9, 5)).to eq(-59049)
  end

  it '15: deve elevar numero decimal com expoente negativo corretamente' do
    expect(potenciacao(0.2, -5)).to eq(3125)
  end

  it '14: deve elevar numero decimal negativo com expoente negativo corretamente' do
    expect(potenciacao(-0.2, -5)).to eq(-3125)
  end
end
