class Validator
  def initialize(data)
    @data = data
  end
  def cpf(cpf)
    digitos = cpf.gsub('.', '').sub('-', '').chars.map{|n| n.to_i}
    soma = 10*digitos[0]+9*digitos[1]+8*digitos[2]+7*digitos[3]+6*digitos[4]+5*digitos[5]+4*digitos[6]+3*digitos[7]+2*digitos[8]
    resto = soma % 11
    digito_verificador1 = 11 - resto
    if digito_verificador1 >= 10
      digito_verificador1 = 0
    end
    if digito_verificador1 == digitos[9]
      soma = digitos[0]*11+digitos[1]*10+digitos[2]*9+digitos[3]*8+digitos[4]*7+digitos[5]*6+digitos[6]*5+digitos[7]*4+digitos[8]*3+digitos[9]*2
      resto = soma % 11
      digito_verificador2 = 11 - resto
      if digito_verificador2 >= 10
        digito_verificador2 = 0
      end
      if digito_verificador2 == digitos[10]
        return true
      end
    end
    return false
  end
  def data_checker()
    if ((@data[:nome_completo] =~ /^[a-záàâãéèêíïóôõöúçñ ]+$/i) != nil and @data[:nome_completo].split(' ').length() >= 2)
      if((@data[:aniversario] =~ /^([0-2][0-9]|(3)[0-1])(\/)(((0)[0-9])|((1)[0-2]))(\/)([1][7-9][0-9][0-9]|[2][0][0-9][0-9]|[2][1][0][0])$/) != nil)
        if ((@data[:senha] =~ /(?=.*[A-Z])(?=.*[0-9])(?=^.{8,}$)[$*&@#a-z]?.*$/) != nil)
          if(cpf(@data[:cpf]))
            return 'Válido'
          end
          return 'Inválido'
        end
        return 'Inválido'
      end
      return 'Inválido'
    end
    return 'Inválido'
  end
end