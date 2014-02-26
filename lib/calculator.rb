class Calculator
  def initialize
    @total = 0
  end

  def total
    @total
  end

  def add(number)
    @total += number
    self
  end

  def subtract(number)
    @total -= number
    self
  end

  def multiply(number)
    @total *= number
    self
  end

  def divide(number)
    @total /= number
    self
  end

end