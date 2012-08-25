class Vehicle
  attr_writer :price
  def initialize(name, price)
    @name = name
    @price = price
  end
  def get_name
    @name
  end
  def get_price 
    @price
  end
  def to_s
    "Vehicle has been initiailised with the Name: #{@name} and Price: #{@price}"
  end
end

class Bike < Vehicle
  def initialize(name, price, dealer)
    super(name, price)
    @dealer = dealer
  end
  def to_s
    "The Vehicle named #{@name} has the dealer as #{@dealer} and has a price of #{@price}"
  end
  def get_dealer
    @dealer
  end
end


bike = Bike.new("Bajaj", 50000, "Bagga Link")
puts bike
bike.price = 70000
puts bike
