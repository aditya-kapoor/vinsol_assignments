class Item
  attr_accessor :name, :quantity
  def initialize
    @name, @quantity = "", 0
  end
  def name=(name)
    @name = name
  end
  def quantity=(qty)
    @quantity = qty
  end
end

class ShoppingList
  def initialize
    # @items = Hash.new(0)
    @items = Array.new
  end
  def item(&block)
    item = Item.new
    yield item
    @items << item
  end
  def to_s
    "Your ShoppingList Is: \n"
    @items.each do |i|
      puts "#{i.name} : #{i.quantity}"
    end
  end
  def item_count
    "#{@items.count}"
  end
end

s1 = ShoppingList.new
s1.item { |i| i.name = "Toothpaste"; i.quantity = 3 }
s1.item { |i| i.name = "Computer"; i.quantity = 1 }
s1.item { |i| i.name = "Laptops"; i.quantity = 2}
puts s1
puts s1.item_count