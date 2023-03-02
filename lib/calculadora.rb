def soma(primeiro_numero, segundo_numero)
    primeiro_numero + segundo_numero
end

def subtracao(primeiro_numero, segundo_numero)
    primeiro_numero - segundo_numero
end

def multiplicacao(primeiro_numero, segundo_numero)
    primeiro_numero * segundo_numero
end

def divisao(primeiro_numero, segundo_numero)
    segundo_numero == 0 ? 'Opa! Zero como divisor' : primeiro_numero / segundo_numero
end

def radiciacao(qual_valor_quer_tirar_raiz, indice_da_raiz)
    if qual_valor_quer_tirar_raiz == 0
        0
    elsif qual_valor_quer_tirar_raiz >= 1
        (qual_valor_quer_tirar_raiz**(1.0/indice_da_raiz)).round
    else
        "Não é possível extrair raiz quadrada de um número negativo no conjunto dos números reais."
    end
end

def potenciacao(qual_valor_quer_elevar, expoente)
    if qual_valor_quer_elevar == 0
        0
    elsif expoente == 0
        1
    else
        if (expoente > 0)
            (qual_valor_quer_elevar**expoente)
        else
            resultado = (1.0/(qual_valor_quer_elevar**(-1*expoente)))
            if qual_valor_quer_elevar.kind_of?Float
                resultado.round 
            else
                resultado
            end
        end
    end
end

