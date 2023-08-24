
def depositar(saldo, extrato, valor):
    if valor > 0:
        saldo += valor; 
        extrato += f"deposito: R${valor:.2f}\n"
    else:
        print("Operação com numeros negativos não é permitida")
    return saldo, extrato

def exibir_extrato(saldo):
    print("\n +++++++++++++++++++++++++++++++++++++++")
    print(f"\n    O valor do extrato: R${saldo:.2f}\n")
    print("\n +++++++++++++++++++++++++++++++++++++++")


def sacar(saldo, valor, extrato, limite, LIMITE_SAQUES, numero_saques):
    
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
    return saldo, extrato

def menu():
    menu = """
    [s] Saque
    [e] Extrato
    [d] Deposito
    [q] Sair

    => """
    return input(menu)


def main():
    saldo = 0
    extrato = ""
    limite = 500
    numero_saques = 0
    LIMITE_SAQUES = 3

    while True:
        opcao = menu()
        
        match opcao:
            case "s":
               valor = float(input ("Digite o valor que deseja sacar: "))
               saldo, extrato = sacar(
                    saldo=saldo, 
                    valor=valor,
                    extrato=extrato,
                    limite=limite, 
                    LIMITE_SAQUES=LIMITE_SAQUES,
                    numero_saques=numero_saques
                )
                
            case "e":
                exibir_extrato(saldo)
                
            case "d":
                valor = float(input("Informe o valor do deposito: " ))
                saldo, extrato = depositar(saldo, extrato, valor)       
            case "q":
                break
            case _:
                print("Nenhuma opção válida!")
    

main()
