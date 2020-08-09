class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender_par, receiver_par, transfer_amount)
    @sender = sender_par
    @receiver = receiver_par
    @amount = transfer_amount
    @status = 'pending'
  end

  def valid?
    if self.receiver.valid? && self.sender.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if self.valid? && sender.balance > amount && self.status == "pending"
      self.sender.balance -= amount
      self.receiver.deposit(amount)
      self.status = "complete"
    else
      reject_transfer
    end
    #binding.pry
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if self.execute_transaction
      self.sender.deposit(amount)
      self.receiver.balance -= amount
      self.status = "reversed"
    end
  end

end
