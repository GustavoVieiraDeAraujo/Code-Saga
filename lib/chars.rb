class Chars
  def unique_quantity(text)
    contador = 0
    text = text.split(' ')
    text.each do |sequence|
      temp = []
      sequence.chars.each do |letter| 
        if !(temp.include? letter)
          contador += 1
          temp = [*temp, letter]
        end
      end
    end
    contador
  end
end