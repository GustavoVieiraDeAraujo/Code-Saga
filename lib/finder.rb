class Finder
  def index_of(list, value)
    retorno = []
    list.each do |element|
      if element.include? value
        posicao = list.find_index(element) 
        retorno.push(posicao)
        list[posicao] = nil
      end      
    end
    retorno
  end
end
