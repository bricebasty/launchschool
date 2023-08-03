def factorial(n, f=n)
  (n - 1).times do
    f *= (n - 1)
    n -= 1
  end
end

factorial(6)