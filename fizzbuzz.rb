class FizzBuzz
  attr_reader :arr
  attr_accessor :i

  def initialize(i)
    @i = i
    @arr = make_array
  end

  def make_array
    arr = []
    while i > 0
      arr.unshift(i)
      @i -= 1
    end
    arr
  end

  def translate(num)
    if num % 15 == 0
      'fizzbuzz'
    elsif num % 3 == 0
      'fizz'
    elsif num % 5 == 0
      'buzz'
    else
      return num
    end
  end

  def print
    arr.map! do |element|
      element = translate(element)
    end
    puts arr
  end

end
