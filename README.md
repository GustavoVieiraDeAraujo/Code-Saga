# Batalha Naval

Nesse desafio, você deve implementar o código que simula um jogo de Batalha Naval, um jogo de tabuleiro para dois jogadores no qual eles têm de adivinhar em quais quadrados estão os navios do oponente. O objetivo de cada jogador é derrubar as embarcações do oponente. Ganha quem derrubar todos os navios adversários primeiro ou tiver o maior número de pontos até determinada rodada.

O jogo usa duas matrizes, uma para cada jogador. No início do jogo, cada jogador dispõe, na matriz, seus barcos e boias na horizontal ou vertical (não é permitido dispor barcos na diagonal), sem que seu oponente saiba da sua distribuição. Há 5 tipos diferentes de navios:

- Porta-aviões: é o maior navio do jogo e ocupa 12 posições da matriz, com formato 2x6. Na matriz de jogo, deve ser representado pela string 'P';
- Navio de Guerra: ocupa 4 posições da matriz, com formato 1x4. Na matriz de jogo, deve ser representado pela string 'N';
- Submarino e Cruzador: ocupam 3 posições da matriz, com formato 1x3. Na matriz de jogo, devem ser representados pelas strings 'S' e 'C', respectivamente;
- Corveta: menor navio do jogo, ocupa 2 posições da matriz, com formato 1x2. Na matriz de jogo, deve ser representado pela string 'c';

Além dos 5 navios, cada jogador possui um set de 2 boias para dispor pelo tabuleiro. Uma boia ocupa apenas 1 posição da matriz e deve ser representada pela string 'B'. Posições da matriz de jogo que não possuem embarcações nem boias devem ser representadas pela string `0`. Nem todos os jogos usam todos os 5 navios e boias: jogos menores podem usar menos peças.

A cada rodada, um jogador deve realizar um ataque na matriz de seu oponente. Esse ataque deve atingir apenas 1 posição da matriz do adversário. Se esse ataque atingir uma embarcação do oponente, este ganha pontos que dependem da embarcação atingida:

- Se o ataque atingir uma posição do Porta-aviões, o jogador ganha 1 ponto;
- Se o ataque atingir uma posição do Navio de Guerra, o jogador ganha 2 pontos;
- Se o ataque atingir uma posição do Submarino ou Cruzador, o jogador ganha 3 pontos;
- Se o ataque atingir uma posição da Corveta, o jogador ganha 5 pontos.

Além disso, caso um jogador afunde uma embarcação do oponente, ele ganha um adicional de 3 pontos. Se um ataque atingir uma boia do oponente, o jogador perde 3 pontos.

Nesse desafio, você deve implementar o código que irá receber:

- As posições iniciais das embarcações de ambos os jogadores, em forma das hashes `player_a` e `player_b`;
- O tamanho da matriz de jogo, em forma da string `matrix_size`;
- A lista de ataques dos jogadores, em forma da string `attacks`;

Seu código deve retornar quem venceu, a quantidade de pontos de cada jogador no fim do jogo e a matriz do jogador perdedor ao final do jogo, com as embarcações representadas da maneira especificada acima. Posições atingidas da matriz devem ser representadas pela string `X`.
