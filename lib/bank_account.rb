class BankAccount
    attr_accessor :balance, :status
    attr_reader :name

    def initialize(name_par)
        @name = name_par
        @status = "open"
        @balance = 1000
    end

    def deposit(money_to_add)
        self.balance = @balance + money_to_add
        self.balance
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        if self.status == "open" && self.balance > 0
            true
        else
            false
        end
    end

    def close_account
        self.status = "closed"
    end

end
