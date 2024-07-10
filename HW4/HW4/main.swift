import Foundation

class BankAccount {
    let accountNumber: String
    var balance: Double

    init(accountNumber: String, balance: Double) {
        self.accountNumber = accountNumber
        self.balance = balance
    }

    func deposit(amount: Double) {
        balance += amount
        print("Пополнено \(amount) на счет \(accountNumber). Новый баланс: \(balance)")
    }

    func withdraw(amount: Double) -> Bool {
        if amount <= balance {
            balance -= amount
            print("Снято \(amount) со счета \(accountNumber). Остаток на счете: \(balance)")
            return true
        } else {
            print("Не удалось снять \(amount) со счета \(accountNumber). Недостаточно средств.")
            return false
        }
    }
}

class Bank {
    var accounts: [String: BankAccount] = [:]

    func addAccount(account: BankAccount) {
        accounts[account.accountNumber] = account
        print("Счет \(account.accountNumber) добавлен с балансом \(account.balance)")
    }

    func transfer(from: String, to: String, amount: Double) {
        if let fromAccount = accounts[from], let toAccount = accounts[to], fromAccount.withdraw(amount: amount) {
            toAccount.deposit(amount: amount)
            print("Переведено \(amount) с \(from) на \(to)")
        } else {
            print("Перевод не выполнен с \(from) на \(to)")
        }
    }

    func printAccounts() {
        for account in accounts.values {
            print("Счет: \(account.accountNumber), Баланс: \(account.balance)")
        }
    }
}

let bank = Bank()

let account1 = BankAccount(accountNumber: "12345", balance: 1000.0)
let account2 = BankAccount(accountNumber: "67890", balance: 500.0)

bank.addAccount(account: account1)
bank.addAccount(account: account2)

print("Состояние счетов до операций:")
bank.printAccounts()

account1.deposit(amount: 200.0)
bank.transfer(from: "12345", to: "67890", amount: 100.0)

print("Состояние счетов после операций:")
bank.printAccounts()


