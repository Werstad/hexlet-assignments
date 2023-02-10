# frozen_string_literal: true

# BEGIN
def fibonacci(n)
  return nil if n.negative?

  return 0 if n.zero?
  return 1 if n == 1

  fibonacci(n - 1) + fibonacci(n - 2)
end
# END
