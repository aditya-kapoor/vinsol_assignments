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
 		puts "Welcome #{@name}\nAmount of #{amount} has been deposited in your account"
 	end
 def withdraw(amount)
 		if amount > @balance
 			puts "Invalid Amount Entered"
 		else
 			@balance -= amount
 			puts "Welcome #{@name} \nAmount of #{amount} has been withdrawn"
 		end
 	end
end

acc1 = Bank.new("Aditya")
acc1.deposit(1000)
acc1.withdraw(500)
puts "#{acc1.name} has the Account Balance Of : #{acc1.balance}"

acc2 = Bank.new("Aditya1",5000)
acc2.deposit(1500)
acc2.withdraw(1000)
acc2.balance
puts "#{acc2.name} has the Account Balance Of : #{acc2.balance}"
