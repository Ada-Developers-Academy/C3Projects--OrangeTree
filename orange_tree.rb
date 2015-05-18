# Pairs: Ashley Watkins & Victoria Shabunia

class OrangeTree
  attr_reader :age, :height, :is_alive

  def initialize
    @height = 0
    @orange_count = 0
    @age = 0
    @is_alive = true
  end

  def height
    puts @height
  end

  def one_year_passes
    if @age < 20 # tree dies at 21 years old
      @age += 1
      @height += 1.5

      if @age > 5
        # oranges of the past year fall off since @orange_count is reassigned
        # grows standard of 50 oranges
        # plus 10 oranges per year the tree has been fruitful (starting at age 6)
        @orange_count = 50 + (10 * (age - 6))
      end

      puts "The orange tree is #{@age} years old, #{@height} feet tall, and has #{@orange_count} oranges."
    else
      @is_alive = false
      @orange_count = 0
      @age = 20
      puts "This tree has died."
    end
  end

  def count_the_oranges
    return @orange_count
  end

  def pick_an_orange
    if @orange_count == 0
      puts "Oops, sorry. The tree is bare."
    else
      @orange_count -= 1
      puts "Yum! Oranges are great for you!\nThere are #{@orange_count} oranges left."
    end
  end
end
