require 'benchmark'

def f1(s)
  i = (s + s).index(s, 1)
  [s[0, i], s.size / i]
end

def f2(s)
  s=~/^(.+?)\1+/?[$1,s.size/$1.size]:[s,1]
end

def f3(s)
  i = 0
  substring = s[0..i]
  until substring * (s.size / substring.size) == s
    i += 1
    substring = s[0..i]
  end
  [substring, s.size / substring.size]
end

test_string = "ababababab"

n = 1000_000
Benchmark.bm do |x|
  x.report("f1:") { n.times { f1(test_string) } }
  x.report("f2:") { n.times { f2(test_string) } }
  x.report("f3:") { n.times { f3(test_string) } }
end
