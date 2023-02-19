class Triangle
  # triange code
  attr_accessor :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c    
  end

  def kind
    validate_triangle
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end

  def validate_triangle
    # Object for storing Boolean values 
    real_triangle = [(a + b > c), (a + c > b), (b + c > a)]
    
    [a, b, c].each { |s| real_triangle << false if s <= 0 }
    raise TriangleError if real_triangle.include?(false)
  end

  class TriangleError < StandardError
    def message
      "you must provide valid values for triangle sides!"
    end
  end
end
