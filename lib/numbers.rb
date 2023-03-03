class Numbers
  def sum_text(numbers_text)
    numbers_text.split("\n").map{|numero| Integer(numero)}.inject(:+)
  end
end

