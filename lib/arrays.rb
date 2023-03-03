class Arrays
  def self.multiplica_antecessor_predecessor(array)
    retorno = [array[0]*array[1]]
    tamanho_array = array.length()
    (1..(tamanho_array-2)).step(1) do |n|
      retorno.push(array[n-1]*array[n+1])
    end
    retorno.push(array[tamanho_array-2]*array[tamanho_array-1])
    retorno
  end
end