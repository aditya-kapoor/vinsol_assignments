def calculate(op1, operator, op2)
  eval( op1.to_s + operator.to_s + op2.to_s )
end

def calculate1(op1, operator, op2)
  op1.send(operator, op2)
end

puts calculate( 1, :+, 2 )
puts calculate1( 5, :/, 5 )
