class StringUtils
  def wavefy(string)
    retorno = ''
    flag = true
    string.chars.each do |letter|
      if flag
        retorno += letter.downcase
        flag = false
      else
        retorno += letter.upcase
        flag = true
      end
    end
    retorno
  end
end