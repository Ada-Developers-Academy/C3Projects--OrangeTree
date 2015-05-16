# Project Orange tree.
# Breakfast level.


class OrangeTree
  attr_reader :age, :is_alive, :orange_count, :height

   def initialize
     @height = 0
     @orange_count = 0
     @age = 0
     @is_alive = true
   end

   def one_year_passes
     if @age < 20
        @age += 1
        @height += 1.5
        if @age > 5
           @orange_count = 50 + (10 * (age - 6))
         end
        puts "The orange tree is #{@age} old, #{@height} feet tall, and has #{@orange_count} oranges."
     else
       @is_alive = false
       @orange_count = 0
       @age = 20
       puts "This tree has died"
     end
   end

   def pick_an_orange
     if @orange_count == 0
       puts "Ooops, sorry. The tree is bare"
     else
     @orange_count -= 1
     puts "Yum! Oranges are great for you!\nThere are #{@orange_count} oranges left."
     end
   end
end

# Orange tree.
# Lunch level
class OrangeGrove

  def initialize(num_of_trees)
    @trees = []
    num_of_trees.times do
      @trees.push(OrangeTree.new)
    end
  end

  def one_year_passes
    @trees.each do |tree|
      tree.one_year_passes
    end
  end

  def sum_of_oranges
    @total_oranges = 0
    @trees.each do |tree|
      @total_oranges += tree.orange_count
    end
    puts "The orange grove has #{@total_oranges} oranges."
  end



end

my_grove = OrangeGrove.new(10)
my_grove.one_year_passes
my_grove.one_year_passes
my_grove.one_year_passes
my_grove.one_year_passes
my_grove.one_year_passes
my_grove.one_year_passes
my_grove.sum_of_oranges
