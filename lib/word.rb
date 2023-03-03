class Word
  def vowels_count(phrase)
    filtro_vogal = 'aeiouyáàâãéèêíïóôõöú'
    phrase.chars.select{|letter| filtro_vogal.include? letter.downcase}.length()
  end

  def consonants_count(phrase)
    filtro_consoante ='bcdfghjklmnpqrstvwyz'
    phrase.chars.select{|letter| filtro_consoante.include? letter.downcase}.length()
  end
end
