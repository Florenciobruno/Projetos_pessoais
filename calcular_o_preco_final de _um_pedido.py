valorHamburguer = float(input())
quantidadeHamburguer = int(input())
valorBebida = float(input())
quantidadeBebida = int(input())
valorPago = float(input())


valorTotalHamburguer = valorHamburguer * quantidadeHamburguer
valorTotalBebida = valorBebida * quantidadeBebida
total = float(valorTotalHamburguer + valorTotalBebida)
troco = float(valorPago - total)


print(f"O preço final do pedido é R$ {total:.2f}. Seu troco é R$ {troco:.2f}.")


