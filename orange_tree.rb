#Orange Tree

class OrangeTree
  attr_reader :height, :age, :orange_count, :max_age, :dead

  def initialize
    @height = 0
    @age = 0
    @orange_count = 0
    @max_age = 100
    @dead = false
  end

  def one_year_passes
    @age += 1
    @height += 0.75
    @orange_count = 0

      if (@age < 3)
        @orange_count = 0
      elsif (@age >= @max_age)
        @dead == true
        puts "Yo tree is ded."
      else
        @orange_count = (@age * 2)
      end

  end

    def count_the_oranges
      puts "Your tree has #{@orange_count} tasty oranges!"
    end

    def tree_height
      puts "Your tree is #{@height}ft. tall."
    end

    def pick_an_orange
      if @orange_count > 0
        @orange_count -= 1
        puts "This orange is DOPE! Don't do drugs."
      else
        puts "Darn, no oranges. :("
      end

    end
end

class OrangeGrove
attr_reader :tree_count, :orange_total, :tree

  def initialize
    puts "How many trees would you like in your grove?"
    @numbers = %w(0 1 2 3 4 5 6 7 8 9 )
    @tree_count = gets.chomp
      while (@tree_count.to_i < 2) || (@tree_count.empty? == true) || (!@numbers.any? { |number| @tree_count.include?(number) })
        puts "#{@tree_count} does not make a grove, stupid. \nJust kidding. But seriously, you need at least two trees for a grove. \nTry again."
        @tree_count = gets.chomp
      end
    @tree_count = @tree_count.to_i
    @orange_total = 0
    @tree = OrangeTree.new
  end

  def one_grove_year
    (@tree.one_year_passes) * @tree_count
    puts "Your trees are #{@tree.age} year(s) old. They each have #{@tree.orange_count} oranges."
  end

  def count_all_oranges
    @orange_total = @tree.orange_count * @tree_count
    puts "Your grove has #{@orange_total} oranges! YAY!"
  end

  # def pick_an_orange
  #   if @orange_total > 0
  #     @orange_total -= 1
  #     puts "This orange is DOPE! Don't do drugs."
  #   else
  #     puts "Darn, no oranges. :("
  #   end
  # end

end
