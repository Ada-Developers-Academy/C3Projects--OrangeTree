# Orange Tree Project

# create orange grove class
class OrangeGrove
  attr_reader :grove, :total_oranges

# create empty grove array
  def initialize
    @grove = []
  end

# user passes number of trees in grove
  def plant_grove(num_trees)
    num_trees.times do
      @grove.push(OrangeTree.new)
    end
  end

# counts all oranges on all trees in array
  def count_all_the_oranges
    @total_oranges = 0
    @grove.each do |tree|
      @total_oranges += tree.orange_count
    end
  return @total_oranges
  end

# ages all tree in grove by one year and recalculates orange count
def one_year_passes_grove
  @total_oranges = 0
  @grove.each do |tree|
    tree.one_year_passes
    @total_oranges += tree.orange_count
  end

end

end




# create orange tree class
class OrangeTree
  attr_reader :height, :age, :orange_count, :is_dead

# give all instances starting point
  def initialize
    @height = 0
    @age = 0
    @orange_count = 0
    @is_dead = false
  end

# ages tree one year
  def one_year_passes
    if @is_dead == false

      @age += 1
      @height += 1

      if @age <= 2
        @orange_count = 0
      elsif @age <= 5
        @orange_count = (@age * 10)
      else
        @is_dead = true
        puts "TREE IS DEAD."
        @orange_count = 0
        exit
      end
    return self
    end
  end

# total number of oranges on tree
  def count_the_oranges
    return @orange_count
  end

# reduces orange count by one
  def pick_an_orange
    #if loop to check if any oranges left
    # if there are still oranges, then subtract from orange count and print yum statement
    if @orange_count > 0
      @orange_count -= 1
      puts "YUM YUM. There are now #{@orange_count} left!"
    else
      puts "There are no oranges left!"
    end
  end


end
