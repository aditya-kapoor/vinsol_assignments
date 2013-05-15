require 'benchmark'
require 'benchmark/ips'

GC.disable

UNSAFE_STRING_METHODS = %w(
  capitalize chomp chop delete downcase gsub lstrip next reverse rstrip
  slice squeeze strip sub succ swapcase tr tr_s upcase prepend
)

N = 10000

Benchmark.bm(13) do |x|
  x.report("Define Method") {
    class Foo
      N.times do 
        UNSAFE_STRING_METHODS.each do |unsafe_method|
          if String.new.respond_to?(unsafe_method) 
            define_method(unsafe_method.to_sym) do |*args, &block|
              to_str.send(unsafe_method, *args, &block)
            end
            define_method("#{unsafe_method}!".to_sym) do |*args|
              @html_safe = false
              super(*args)
            end
          end
        end
      end
    end
  }
end

Benchmark.ips do |x|
  x.report("Call using define Method") { "String".capitalize }
end

Benchmark.bm(13) do |x|
  x.report("Class Eval") {
    class Foo
      N.times do 
        UNSAFE_STRING_METHODS.each do |unsafe_method|
          if 'String'.respond_to?(unsafe_method)
            class_eval <<-EOT, __FILE__, __LINE__ + 1
              def #{unsafe_method}(*args, &block)       # def capitalize(*args, &block)
                to_str.#{unsafe_method}(*args, &block)  #   to_str.capitalize(*args, &block)
              end                                       # end
   
              def #{unsafe_method}!(*args)              # def capitalize!(*args)
                @html_safe = false                      #   @html_safe = false
                super                                   #   super
              end                                       # end
            EOT
          end
        end
      end
    end
  }
end

Benchmark.ips do |x|
  x.report("Call using class eval") { "String".capitalize }
end