# Iterative Fibonacci Sequence
def fibs(n)
  return [] if n == 0
  return [0] if n == 1
  sequence = [0, 1]
  (2...n).each do
    sequence << sequence[-1] + sequence[-2]
  end
  sequence
end

# Recursive Fibonacci Sequence
def fibs_rec(n)
  puts 'This was printed recursively' if n > 0
  return [] if n == 0
  return [0] if n == 1
  return [0, 1] if n == 2
  
  sequence = fibs_rec(n - 1)
  sequence << sequence[-1] + sequence[-2]
end

# Testing Fibonacci functions
puts "Iterative Fibonacci:"
p fibs(8)  # => [0, 1, 1, 2, 3, 5, 8, 13]
puts "Recursive Fibonacci:"
p fibs_rec(8)  # => [0, 1, 1, 2, 3, 5, 8, 13]
