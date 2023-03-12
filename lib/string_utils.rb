class StringUtils
  def wavefy(string)
    letters = string.chars.map.with_index do |letter, index|
      index.even? ? letter.downcase : letter.upcase
    end
    letters.join
  end
end
