class WordPuzzle
  def calculate_word_weight(palavra)
    peso_palavra = 0
    alfabeto = 'abcdefghijklmnopqrstuvwxyz'.chars
    array_letras_palavra = palavra.chars
    array_letras_palavras_minuscula = array_letras_palavra.map{|letra| letra.downcase}
    verificar_se_esta_em_ordem_alfabetica = array_letras_palavras_minuscula == array_letras_palavras_minuscula.sort
    verificar_se_tem_so_uma_letra = array_letras_palavra.length() == 1
    if !(verificar_se_esta_em_ordem_alfabetica or verificar_se_tem_so_uma_letra)
      array_letras_palavra.each do |letra|
        if(letra == letra.upcase)
          peso_palavra -= (alfabeto.find_index(letra.downcase)+1)
        else
          peso_palavra += (alfabeto.find_index(letra)+1)
        end
      end
    end
    peso_palavra
  end
  
  def phrase_weight(phrases)
    pesos = []
    phrases.each do |palavra_ou_frase|
      verificar_se_frase = palavra_ou_frase.include? ' '
      if (verificar_se_frase)
        peso_da_frase = 0
        palavras_frase = palavra_ou_frase.split(' ')
        palavras_frase.each do |palavra|
          peso_da_frase += calculate_word_weight(palavra)
        end
        pesos.push(peso_da_frase)
      else
        pesos.push(calculate_word_weight(palavra_ou_frase))
      end
    end
    pesos
  end
end

