class OrangeTree
  attr_reader :age, :is_alive, :orange_count, :height
  attr_accessor :death_year, :baseline_oranges
  # temp
  attr_accessor :trees, :is_alive

  def initialize
    @height = 0
    @orange_count = 0
    @age = 0
    @is_alive = true
    @death_year = 21
    # each tree will produce *at least* these many oranges per year
    @baseline_oranges = 50
  end

  def one_year_passes
    if @age < @death_year
      @age += 1
      @height += 1.5

      if @age > 5
        # grows standard of @baseline_oranges
        # plus 10 oranges per year the tree has been fruitful (starting at age 6)
        # note: oranges of the past year fall off since @orange_count is reassigned
        @orange_count = @baseline_oranges + (10 * (age - 6))
      end

      puts "The orange tree is #{@age} years old, #{@height} feet tall, and has #{@orange_count} oranges."

    else
      @is_alive = false
      @orange_count = 0
      @age = 20
      puts "This tree has died."
    end
  end

  def pick_an_orange
    if @orange_count == 0
      puts "Oops, sorry. The tree is bare."
    else
      @orange_count -= 1
      puts "Yum! Oranges are great for you!\nThere are #{@orange_count} oranges left."
    end
  end

  # create a new instance of `OrangeTree`
  # call this method on that instance
  def plant_on(grove)
    # `.add_tree` of `OrangeGrove` pushes this instance to OrangeGrove's array `@trees`
    grove.add_tree(self)
  end
end

class OrangeGrove
  def initialize(num_of_trees)
    @trees = []
    @total_oranges = 0
    @soil_quality = 50 # 0 = low soil quality; 50 = high soil quality

    num_of_trees.times do
      @trees.push(OrangeTree.new)
      # more trees = lower soil_quality
      @soil_quality -= 1
    end
  end

  def one_year_passes
    trees_alive_last_year = 0
    trees_alive_this_year = 0

    @trees.each do |tree|
      if tree.is_alive
        trees_alive_last_year += 1
      end

      tree.one_year_passes

      # checks again in case any trees died after a year passed
      if tree.is_alive
        trees_alive_this_year += 1
      end

      if trees_alive_this_year < trees_alive_last_year
        # increase soil quality since providing for less trees
        @soil_quality += 1
      else
        # reduce soil_quaity and effects since each tree grew
        @soil_quality -= 1
        # tree gets closer to death
        tree.death_year -= 1
        # tree produces less oranges next year
        tree.baseline_oranges -= 1
      end
    end

  end

  def count_all_the_oranges
    @trees.each do |tree|
      @total_oranges += tree.orange_count
    end

    return @total_oranges
  end

  def add_tree(tree)
    @trees.push(tree)
  end
end
