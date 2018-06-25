class Gpa
  def self.select_range(min, max)
    (min..max).step(0.1).map { |num| num.round(1) }.reverse
  end

  def self.select_options
    select_range(2, 4).map { |num| [num, num] }
  end
end
