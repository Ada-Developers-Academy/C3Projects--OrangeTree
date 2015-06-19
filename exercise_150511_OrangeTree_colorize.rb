#### exercise_150511_OrangeTree.rb
require "colorize"

class OrangeTree
  attr_reader :age, :is_alive, :orange_count, :height
  ##`def height` and `def count_the_oranges` NOT necessary; added :height and :orange_count to the attr_reader, and every time the tree ages, height, age, and orange count are printed.

  def initialize
    @height = 0
    @age = 0
    @orange_count = 0
    @is_alive = true
  end

  ## Ages the tree one year
  def one_year_passes
    if @age <20
      @age += 1
      @height += 1.5
      if @age > 5
        @orange_count = 50 + ((age-6) * 10) # No oranges until it's 6 yrs old. 50 oranges when it's 6, 60 oranges when it's 7, etc.
      end
      print "The orange tree is #{@age} years old, #{@height} feet tall, and has "
      print "#{@orange_count} oranges".colorize(:light_yellow)
      puts"."
    else
      @is_alive = false # Dies at the end of being 20, never turns 21.
      @orange_count = 0
      @age = 20
      puts "This tree has died.".colorize(:light_black)
    end
  end

  ## Reduces count_the_oranges by 1; Returns string telling how delicious it is, or says there are no more oranges.
  def pick_an_orange
    if @orange_count == 0
      puts "Oops, sorry. The tree is bare.".colorize(:white)
    else
      @orange_count -= 1
      print "Yum! Oranges are great for you!\nThere are "
      print "#{@orange_count} oranges".colorize(:light_yellow)
      puts " left."
    end
  end

  ## Plant a tree in a grove
  def plant_on(grove)
    grove.add_a_tree(self)
  end

end


class OrangeGrove

  def initialize(num_of_trees)
    @trees_in_grove = [] # Will hold our trees
    @num_of_trees = num_of_trees

    @num_of_trees.times do
      @trees_in_grove.push(OrangeTree.new)
    end
  end

  def one_year_passes
    @trees_in_grove.each do |tree|
      tree.one_year_passes
    end
  end

  def count_all_the_oranges
    @total_oranges = 0

    @trees_in_grove.each do |tree|
      @total_oranges += tree.orange_count
    end

    print "You have "
    print "#{@total_oranges} oranges".colorize(:light_yellow)
    puts "."
  end

  def add_a_tree(specific_tree)
    @trees_in_grove.push(specific_tree)
  end

end

##SELECT TESTS##
# my_tree = OrangeTree.new
# my_tree.one_year_passes
# my_tree.one_year_passes
# puts "  My_tree is 2 years old.".colorize(:blue)
# my_grove = OrangeGrove.new(1)
# my_grove.one_year_passes
# puts "  My_grove is 1 year old.".colorize(:blue)
# my_tree.plant_on(my_grove)
# my_grove.one_year_passes
# puts "  The tree that came with my grove is 2 years old, and my_tree is 3 years old.".colorize(:blue)
# my_grove.count_all_the_oranges
