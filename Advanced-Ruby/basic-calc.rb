def calculate(op1, operator, op2)
  puts eval( op1.to_s + operator.to_s + op2.to_s )
end

calculate( 1, :+, 2 )
calculate( 5, :/, 5 )
