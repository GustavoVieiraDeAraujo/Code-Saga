class DataControl
  def initialize(data_list)
    @data_list = data_list
  end
  def validate_data_list()
    invalidos = @data_list.each_index.select do |i|
      Validator.new(@data_list[i]).data_checker == 'Inválido'
    end
    invalidos.empty? ? 'Todos são válidos' : invalidos
  end
end