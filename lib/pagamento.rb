class Pagamento
    attr_accessor :produto, :quantidade, :preco
    def initialize(quantidade:, preco:, produto: 'Sem nome')
        @produto = produto
        @quantidade = quantidade
        @preco = preco
    end

    def calcular_valor
        @valor = @quantidade * @preco
    end
    
    def valor
        @valor
    end

    def aplicar_desconto(porcentagem)
      @valor *= (1 - (porcentagem.to_f/100))
    end
end
