menu = """

[s] Saque
[e] Extrato
[d] Deposito
[q] Sair

=> """

saldo = 0
extrato = ""
limite = 500
numero_saques = 0
LIMITE_SAQUES = 3


while True:
    opcao = input(menu)
    
    match opcao:
        case "s":
            valor = float(input ("Digite o valor que deseja sacar: "))
            if valor >= limite:
                print("O seu limite de saque está limitado a R$ 500,00")
            elif saldo < valor:
                print("Saldo insuficiente.")
            elif numero_saques < LIMITE_SAQUES:
                saldo = saldo - valor
                extrato += f"saque: R$ -{valor:.2f}\n"
                numero_saques += 1
            else:
                print ("Somente 3 saques por dia")
               
        case "e":
            print("\n +++++++++++++++++++++++++++++++++++++++")
            print(f"\n    O valor do extrato: R${saldo:.2f}\n")
            print("\n +++++++++++++++++++++++++++++++++++++++")
            
        case "d":
            valor = float(input("Informe o valor do deposito: " ))

            if valor > 0:
                saldo += valor; 
                extrato += f"deposito: R${valor:.2f}\n"
            else:
                print("Operação com numeros negativos não é permitida")
            
        case "q":
            break
        case _:
            print("Nenhuma opção válida!")
    



