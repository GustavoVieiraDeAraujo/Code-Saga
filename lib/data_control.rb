class DataControl
  def initialize(data_list)
    @data_list = data_list
  end
  def validate_data_list()
    invalidos = []
    @data_list.each do |data|
      if (Validator.new(data).data_checker() == 'Inválido')
        invalidos.push(@data_list.find_index(data))
      end
    end
    if (invalidos.empty?)
      return 'Todos são válidos'
    else 
      return invalidos
    end
  end
end