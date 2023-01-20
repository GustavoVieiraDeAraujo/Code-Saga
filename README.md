# Torneio intergalático

Está sob sua responsabilidade atualizar e registrar os placares do maior torneio marcial já realizado em nossa galáxia. Para isso, você dispõe de uma lista que descreve quais as lutas que ocorreram e o resultado dessas lutas. Para a classificação nesse torneio, não basta apenas que os competidores vençam as partidas: eles precisam acumular pontos, e os pontos vencidos ou perdidos em uma partida dependem da colocação de cada participante da luta em questão.

As regras são as seguintes:

- Não existe eliminação. Todos podem lutar contra todos, aleatoriamente;
- O sistema de pontos funciona da seguinte maneira:
  - A pessoa que vencer uma partida, ganha no mínimo 1 ponto. Além disso, ganha 1 ponto a mais por cada ponto de diferença entre ela e a pessoa que foi derrotada, caso a pessoa derrotada tenha mais pontos que a vencedora;
  - A pessoa que perde uma partida, só perde pontos se tiver mais pontos do que a pessoa que a derrotou. Neste caso, ela perde 1 ponto para cada ponto de diferença entre ela e a pessoa vencedora, sendo possível perder, no máximo, 3 pontos;
- Em caso de empate ao final de uma rodada, a pessoa com mais pontos no início do torneio fica à frente.

Vamos supor uma luta entre alguém que tem 12 pontos no torneio contra uma pessoa que tem 3 pontos. Caso a que tem 12 pontos vença a luta, ela ganha 1 ponto e seu adversário não perde nenhum ponto. Caso o contrário, a pessoa que possui 3 pontos ganha 10 pontos, 1 pela vitória e 9 pela diferença de pontos entre ela e seu adversário que, por sua vez, perde 3 pontos.

Nesse desafio, você deve implementar um código que irá receber um hash `initial_points`, que representa a quantidade de pontos de cada candidato no momento em que você deve começar a fazer os registros, um arquivo `match_results` que contém as lutas realizadas naquele torneio e seus vencedores, e a variável `rounds`, que representa quantos rounds você tem que acompanhar. Seu programa deve retornar um array de hashes que contém a classificação em todos os rounds que você acompanhou.

# Informações adicionais

- Aqui tem dois exemplos de documentações que podem ajudar a lidar com a classe `File`: [ruby-doc](https://ruby-doc.org/3.2.1/File.html) e [rubyguides](https://www.rubyguides.com/2015/05/working-with-files-ruby/);
- Você não deve editar os arquivos de texto e nem os mover de pasta.
