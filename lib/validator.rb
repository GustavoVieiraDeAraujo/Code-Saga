class Validator
  def initialize(data)
    @data = data
  end
  
  def valid_cpf?(cpf)
    digitos = cpf.gsub(/[.-]/, '').chars.map(&:to_i)
    soma = digitos.first(9).zip([10, 9, 8, 7, 6, 5, 4, 3, 2]).sum { |a, b| a * b }
    digito_verificador1 = 11 - (soma % 11)
    digito_verificador1 = 0 if digito_verificador1 >= 10
    return false unless digito_verificador1 == digitos[9]
    soma = digitos.first(10).zip([11, 10, 9, 8, 7, 6, 5, 4, 3, 2]).sum { |a, b| a * b }
    digito_verificador2 = 11 - (soma % 11)
    digito_verificador2 = 0 if digito_verificador2 >= 10
    digito_verificador2 == digitos[10]
  end

  def valid_name?(name)
    name =~ /^[a-záàâãéèêíïóôõöúçñ ]+$/i && name.split(' ').length >= 2
  end

  def valid_birthday?(birthday)
    birthday =~ /^([0-2][0-9]|(3)[0-1])\/(((0)[0-9])|((1)[0-2]))\/([1][7-9][0-9][0-9]|[2][0][0-9][0-9]|[2][1][0][0])$/
  end

  def valid_password?(password)
    password =~ /(?=.*[A-Z])(?=.*[0-9])(?=^.{8,}$)[$*&@#a-z]?.*$/
  end

  def data_checker
    return 'Inválido' unless valid_name?(@data[:nome_completo])
    return 'Inválido' unless valid_birthday?(@data[:aniversario])
    return 'Inválido' unless valid_password?(@data[:senha])
    return 'Inválido' unless valid_cpf?(@data[:cpf])
    'Válido'
  end
end