module MyModule
  def chained_aliasing(*args)
    args.each do |arg|
      original_method = "original #{arg}"
      alias_method original_method, arg
      define_method("#{arg}_with_logger".intern) do
        puts "Logging Start"
        send(original_method)
        puts "Logging Ends"
      end
      define_method("#{arg}_without_logger".intern) do
        send(original_method)
      end
      define_method("#{arg}".intern) do
        send("#{arg}_with_logger")
      end
    end
  end
end

class Hello 
  extend MyModule
  def greet
    puts "Hello"
  end
  def put 
    puts "Put"
  end
  chained_aliasing :greet, :put
end

say = Hello.new
say.greet
say.greet_with_logger
say.greet_without_logger
say.put
say.put_with_logger
say.put_without_logger