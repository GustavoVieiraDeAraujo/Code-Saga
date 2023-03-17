class WordPuzzle
  def calculate_word_weight(palavra)
    peso_palavra = 0
    alfabeto = ('a'..'z').to_a
    array_letras_palavras_minuscula = palavra.downcase.chars
    if !array_letras_palavras_minuscula.sort.eql?(array_letras_palavras_minuscula) && palavra.length > 1
      palavra.each_char do |letra|
        peso_palavra += (letra.upcase == letra) ? -(alfabeto.index(letra.downcase)+1) : (alfabeto.index(letra.downcase)+1)
      end
    end
    peso_palavra
  end
  
  def phrase_weight(phrases)
    pesos = phrases.map do |palavra_ou_frase|
      if palavra_ou_frase.include?(' ')
        palavras_frase = palavra_ou_frase.split
        palavras_frase.sum { |palavra| calculate_word_weight(palavra) }
      else
        calculate_word_weight(palavra_ou_frase)
      end
    end
    pesos
  end
end

