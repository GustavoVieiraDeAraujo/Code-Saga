# Abrindo o cofre secreto

John, um renomado arqueólogo, sempre está em busca de resquícios de civilizações antigas para desbravar seus segredos e costumes. Por vezes, acaba adentrando situações bastante complexas que o fazem repensar sua profissão...

No momento, John está em uma dessas situações: preso em uma sala onde a única saída é a entrada de um cofre que, segundo suas fontes, possui diversos segredos do passado. No chão desta sala, estão várias tábuas conectadas em formato de quadrados. O centro de cada uma delas possui uma letra esculpida, da seguinte forma:

![painel](support/painel.png)

John percebeu, pela sala, uma lista de direções que trabalhavam com as letras descritas nas tábuas e, logo, percebeu que deveria se tratar de algum tipo de mecanismo para abrir a porta do cofre. Além disso, identificou um texto que parecia ter instruções:

"Pelas tábuas, apenas nas direções horizontal e vertical pode-se transitar. Reduzido seu tempo será, sempre que um trecho do caminho repetir."

Sem saída, John resolve pisar no primeiro quadrado e iniciar o puzzle. Nesse momento, um timer aparece e, logo, John percebe que terá que ser bastante rápido se quiser conseguir acessar os tesouros do cofre.

Nesse desafio, você deve escrever o código que determina se John conseguirá ou não abrir o cofre a tempo, dada uma lista de instruções descrevendo as movimentações nas tábuas `movement_list`, o tempo perdido ao repetir um trecho do caminho `repeated_path_time_loss`, o tempo que John demora para passar entre duas tábuas adjacentes `running_time` e o tempo máximo que John tem para terminar o puzzle `max_time`. Seu código deve retornar a quantidade de tempo restante no relógio quando John finaliza as instruções, caso ele consiga terminar o puzzle a tempo, ou, caso não consiga, a quantidade de tempo que necessitaria a mais para terminar as instruções.

## Informações Adicionais

- Um trecho de caminho é considerado o mesmo se aquele trecho já foi percorrido antes, independente do sentido. Ou seja, os caminhos `B -> C` e `C -> B` são considerados o mesmo caminho, por exemplo.
