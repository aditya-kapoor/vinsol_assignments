$before_callback = []
$after_callback = []
  
module ModuleFilter

  def self.included(klass)
    klass.extend(ClassMethods)
    klass.const_set(:METHOD_HASH, {})
    klass.instance_methods(false) do |meth|
      wrap_method(klass, meth)
    end

    def klass.method_added(meth)
      # puts "method_added #{meth}"
      return if @_adding_a_method
      @_adding_a_method = true
      ModuleFilter.wrap_method(self, meth)
      @_adding_a_method = false
    end
  end

  def self.wrap_method(klass, meth)
    method_hash = klass.const_get(:METHOD_HASH)
    method_hash[meth] = klass.instance_method(meth)
    body = %{
    def #{meth}
      call_sequence = []
      before_filter_hash = $before_callback.detect{|i| i.class == Hash}
      after_filter_hash = $after_callback.detect{|i| i.class == Hash}
      if(before_filter_hash.nil? && after_filter_hash.nil?)
        call_sequence.concat($before_callback)
        call_sequence.concat([:#{meth}])
        call_sequence.concat($after_callback)
      end
      if(!before_filter_hash.nil? && after_filter_hash.nil?)
        methods_in_only = before_filter_hash.fetch(:only, nil)
        methods_in_except = before_filter_hash.fetch(:except, nil)
        if(methods_in_only.nil?)
          #method in except part
          if(methods_in_except == :#{meth})
            call_sequence.concat([:#{meth}])
            call_sequence.concat($after_callback)
          else
            call_sequence.concat($before_callback.reverse.drop(1))
            call_sequence.concat([:#{meth}])
            call_sequence.concat($after_callback)
          end
        else
          #method in only part
          if(methods_in_only == :#{meth})
            call_sequence.concat($before_callback.reverse.drop(1))
            call_sequence.concat([:#{meth}])
            call_sequence.concat($after_callback)
          else
            call_sequence.concat([:#{meth}])
            call_sequence.concat($after_callback)
          end
        end
      end
      if(before_filter_hash.nil? && !after_filter_hash.nil?)
        methods_in_only = after_filter_hash.fetch(:only, nil)
        methods_in_except = after_filter_hash.fetch(:except, nil)
        if(methods_in_only.nil?)
          #method in except part
          if(methods_in_except == :#{meth})
            call_sequence.concat($before_callback)
            call_sequence.concat([:#{meth}])
          else
            call_sequence.concat($before_callback)
            call_sequence.concat([:#{meth}])
            call_sequence.concat($after_callback.reverse.drop(1))
          end
        else
          #method in only part
          if(methods_in_only == :#{meth})
            call_sequence.concat($before_callback)
            call_sequence.concat([:#{meth}])
            call_sequence.concat($after_callback.reverse.drop(1))           
          else
            call_sequence.concat($before_callback)
            call_sequence.concat([:#{meth}])
          end
        end
      end
      if(!before_filter_hash.nil? && !after_filter_hash.nil?)
        before_methods_in_only = before_filter_hash.fetch(:only, nil)
        before_methods_in_except = before_filter_hash.fetch(:except, nil)
        after_methods_in_only = after_filter_hash.fetch(:only, nil)
        after_methods_in_except = after_filter_hash.fetch(:except, nil)
        if(before_methods_in_only == :#{meth})
          if(after_methods_in_except == :#{meth})
            call_sequence.concat($before_callback.reverse.drop(1))
            call_sequence.concat([:#{meth}])
          else
            call_sequence.concat($before_callback.reverse.drop(1))
            call_sequence.concat([:#{meth}])
            call_sequence.concat($after_callback.reverse.drop(1))
          end
        else
          if(before_methods_in_except == :#{meth})
            if(after_methods_in_only == :#{meth})
              call_sequence.concat([:#{meth}])
              call_sequence.concat($after_callback.reverse.drop(1))
            else
              call_sequence.concat($before_callback.reverse.drop(1))
              call_sequence.concat([:#{meth}])
            end
          else
            call_sequence.concat($before_callback.reverse.drop(1))
            call_sequence.concat([:#{meth}])
            call_sequence.concat($after_callback.reverse.drop(1))
          end
        end    
      end
      call_sequence.each do |method|
        puts method
      end
    end
  }
  # puts body
  klass.class_eval body
  end
  
  module ClassMethods
    def before_filter(*args)
      $before_callback = args
    end

    def after_filter(*args)
      $after_callback = args
    end
  end

end

class Filter
  include ModuleFilter
  before_filter :foo, :bar, :only => :hello_tutu
  after_filter :sayonara, :tata, :except => :hello_tutu

  def foo
    puts "Foo"
  end
  def bar
    puts "Bar"
  end
  def sayonara
    puts "Sayonara"
  end
  def tata
    puts "BBYE..Tata"
  end
  def hello_world
    puts "hello_word"
  end
  def hello_tutu
    puts "hello_tutu"
  end
end

f = Filter.new
f.hello_tutu
# f.hello_world