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
end
