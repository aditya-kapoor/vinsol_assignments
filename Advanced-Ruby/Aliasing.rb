module MyModule
  def chained_aliasing(*args)
    special_char_patt = /[!|?]/
    args.each do |arg|
      original_method, original_method_with_logger, original_method_without_logger = check_for_special_chars(arg, special_char_patt)
      alias_method original_method, arg
      define_method(original_method_with_logger.intern) do
        puts "Logging Start"
        send(original_method)
        puts "Logging Ends"
      end
      define_method(original_method_without_logger.intern) do
        send(original_method)
      end
      define_method("#{arg}".intern) do
        send(original_method_with_logger)
      end
    end
  end

  def check_for_special_chars(arg, special_char_patt)
    match = arg.to_s.match(special_char_patt)
    if(match.nil?)
      original_method = "original #{arg}"
      original_method_with_logger = "#{arg}_with_logger"
      original_method_without_logger = "#{arg}_without_logger"
    else
      temp_arg = arg.to_s.gsub(match[0],"")
      original_method = "original #{arg}"
      original_method_with_logger = "#{temp_arg.intern}_with_logger#{match[0]}"
      original_method_without_logger = "#{temp_arg.intern}_without_logger#{match[0]}"
    end
    return original_method, original_method_with_logger, original_method_without_logger
  end
end

class Hello 
  extend MyModule
  def greet
    puts "Hello"
  end
  def put?
    puts "Put"
  end
  chained_aliasing :greet, :put?
end

say = Hello.new
say.greet
say.greet_with_logger
say.greet_without_logger
say.put?
say.put_with_logger?
say.put_without_logger?
