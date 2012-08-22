class Bank
 attr_reader :balance, :name
 @@accnt_no = 0
 def initialize(name,balance=1000)
    @name = name
    @account_no = @@accnt_no
    @balance = balance
    @@accnt_no += 1
    puts "Congratulations #{@name}!! Your Account has been created"
 	end
 def deposit(amount)
    @balance += amount
    puts "Hello #{@name}..Amount of #{amount} has been deposited in your account\nYour balance is #{balance}"
 end
 def withdraw(amount)
  if amount >= @balance
    puts "Invalid Amount of #{amount} Entered"
  else
    @balance -= amount
    puts "Hello #{@name}..Amount of #{amount} has been withdrawn\nYour balance is #{balance}"
    end
  end
end

acc1 = Bank.new("Aditya")
acc1.deposit(1000)
acc1.withdraw(3100)
acc1.withdraw(500)
puts "#{acc1.name} has the Account Balance Of : #{acc1.balance}"
