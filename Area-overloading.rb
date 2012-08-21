class AreaClass
  def initialize
    @area = 0
  end
  def area(*args)
    case (args.length)
      when 1 then 
        puts "Circle"; 
        @area = 3.14 * args[0] ** 2
        puts "#Area IS : #{@area}"
      when 2 then 
        puts "Rectangle"  
        @area = args[0] * args[1]
        puts "Area Is: #{@area}"
      when 3 then 
        puts "Triangle"
        s = (args[0] + args[1] + args[2])/2
        @area = Math.sqrt(s*(s-args[0])*(s-args[1])*(s-args[2]))
        puts "Area Is : #{@area}"
        else puts "Error"
        end
    end
end


Circle = AreaClass.new()
Rectangle = AreaClass.new()
Triangle = AreaClass.new()
Circle.area(2.0)
Rectangle.area(4.0,5.0)
Triangle.area(6.0,8.0,10.0)
