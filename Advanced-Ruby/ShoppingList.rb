class ShoppingList
  def initialize
    @items = Hash.new(0)
    @name = ""
    @quantity = 0
  end
  def item(&block)
    instance_eval(&block)
  end
  def name(name)
    @name = name
  end
  def quantity(qty)
    @quantity = qty
    @items[@name] += @quantity
  end
  def to_s
    "Your ShoppingList Is: \n#{@items}"
  end
end

s1 = ShoppingList.new
s1.item { |i| i.name("Toothpaste"); i.quantity(3) }
s1.item { |i| i.name("Computer"); i.quantity(1) }
s1.item { |i| i.name("Laptops"); i.quantity(2)}
s1.item { |i| i.name("Toothpaste");i.quantity(2)}
puts s1