
# Orange Tree class
  class OrangeTree
    attr_reader :height, :age, :orange_count, :max_age, :dead

    def initialize
      @height = 0
      @age = 0
      @orange_count = 0
      @max_age = 100
      # @dead = false
    end

    HEIGHT_INCREMENT = 0.75
    MIN_AGE_FOR_ORANGE_GROWTH = 3

    # When one year passes, increases age and height
    def death
      # @dead == true
      return "Yo tree is ded."
    end

    def one_year_passes
      @orange_count = 0
      @age += 1
      @height += HEIGHT_INCREMENT

      # trees less than 3 years of age don't grow oranges
      if @age < MIN_AGE_FOR_ORANGE_GROWTH
        @orange_count = 0

      # once max age is reached, tree dies
      elsif @age >= @max_age
        death

      # after 3 years, orange count increases
      else
        @orange_count = @age * 2
      end

    end

    # outputs count of oranges at current age
    def count_the_oranges
      puts "Your tree has #{@orange_count} tasty oranges!"
      return @orange_count
    end

    # outputs tree height at current age
    def tree_height
      puts "Your tree is #{@height} feet tall."
    end

    # when an orange is picked, decrement orange count
    def pick_an_orange
      if @orange_count > 0
        @orange_count -= 1
        tasty_orange = "This orange is DOPE! Don't do drugs."
        puts tasty_orange
        return tasty_orange
      else
        no_oranges = "Darn, no oranges. :("
        puts no_oranges
        return @orange_count
      end
    end
  end

# Orange Grove class
class OrangeGrove
  attr_reader :tree_count, :orange_total, :tree

  # during initialization, user specifies number of trees. Must be > 1.
  def initialize
    puts "How many trees would you like in your grove?"
    @numbers = %w(0 1 2 3 4 5 6 7 8 9)
    @tree_count = gets.chomp
      while @tree_count.to_i < 2 || @tree_count.empty? == true || !@numbers.any? { |number| @tree_count.include?(number) }
        puts "#{@tree_count} does not make a grove, stupid. \nJust kidding. But seriously, you need at least two trees for a grove. \nTry again."
        @tree_count = gets.chomp
      end
    @tree_count = @tree_count.to_i
    @orange_total = 0
    @tree = OrangeTree.new
  end

  # when one grove year passes, output age and number of oranges on each tree.
  def one_grove_year
    (@tree.one_year_passes) * @tree_count
    puts "Your trees are #{@tree.age} year(s) old. They each have #{@tree.orange_count} oranges."
  end

  # count all oranges on all trees in grove.
  def count_all_oranges
    @orange_total = @tree.orange_count * @tree_count
    puts "Your grove has #{@orange_total} oranges! YAY!"
    return @orange_total
  end

end
