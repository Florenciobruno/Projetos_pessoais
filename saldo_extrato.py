menu = """
[1] Depósitos
[2] Saques
[3] Extrato
[4] Sair

=> """

saldo = 0
limite = 500
extrato = ""
numeroMaxSaquesDia = 3
saquesRealizados = 0

while True:
    print(menu)
    opcao = input("Escolha uma opção: ")

    if opcao == "1":
        valor = float(input("Qual valor deseja depositar? "))

        if valor > 0:
            saldo += valor
            extrato += f"Depósito de: R${valor:.2f} realizado com sucesso\n"
        else:
            print("Não é possível depositar o valor informado, formato inválido.")

    elif opcao == "2":
        valor = float(input("Informe o valor do saque: "))

        saldo_insuficiente = valor > saldo
        valorParaSaquesExcedidos = valor > limite
        saquesDiariosExcedidos = saquesRealizados >= numeroMaxSaquesDia

        if saldo_insuficiente:
            print("Seu saldo é insuficiente para essa operação.")
        elif valorParaSaquesExcedidos:
            print("Você já sacou o total disponível no dia de hoje, tente novamente amanhã ou fale com seu gerente.")
        elif saquesDiariosExcedidos:
            print("Você já realizou todos os saques disponíveis no dia de hoje, tente novamente amanhã ou fale com seu gerente.")
        else:
            saldo -= valor
            extrato += f"Saque: R${valor:.2f}\n"
            saquesRealizados += 1

    elif opcao == "3":
        print("\n============= Extrato =============")
        print("Não foram encontradas movimentações em seu extrato" if not extrato else extrato)
        print(f"\nSaldo: R${saldo:.2f}")
        print("===================================")

    elif opcao == "4":
        print("Encerrando o programa...")
        break

    else:
        print("Opção inválida, escolha uma das opções no menu inicial.")
