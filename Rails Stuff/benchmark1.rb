require 'benchmark'
require 'benchmark/ips'
GC.disable

N = 10000

Benchmark.bm(13) do |x|
  x.report("Divmod") do
    N.times do 
      x = 100000
      a,b = x.divmod(7)
    end
  end
end

Benchmark.bm(13) do |x|
  x.report("regular job") do
    N.times do 
      x = 100000
      a = x.div(7)
      b = x % 7
    end
  end
end